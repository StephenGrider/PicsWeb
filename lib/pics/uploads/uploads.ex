defmodule Pics.Uploads do
  import Ecto.Query, warn: false
  alias Pics.Repo

  alias Pics.Uploads.Image

  def list_images() do
    Repo.all(Image)
  end

  def create_image_with_user(attrs, user) do
    upload_path = upload_file(attrs)

    user
    |> Ecto.build_assoc(:images)
    |> Image.changeset(%{path: upload_path})
    |> Repo.insert()
  end

  defp create_filename(attrs) do
    file_extension = Path.extname(attrs.filename)
    file_uuid = UUID.uuid4(:hex)
    "#{file_uuid}#{file_extension}"
  end

  defp upload_file(attrs) do
    s3_bucket = "soimagesosweet"
    s3_filename = create_filename(attrs)
    {:ok, file_binary} = File.read(attrs.path)
    {:ok, res} =
      ExAws.S3.put_object(s3_bucket, s3_filename, file_binary)
      |> ExAws.request()

    "https://s3-us-west-2.amazonaws.com/my123-image-storage/#{s3_filename}"
  end
end
