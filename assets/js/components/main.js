import React, { Component } from 'react';

class Main extends Component {
  constructor(props) {
    super(props);

    this.state = { images: [] };
  }

  componentWillMount() {
    this.props.socket.connect();

    let channel = this.props.socket.channel("images:all", {})
    channel.join()
      .receive("ok", resp => { this.setState({ images: resp }) })

    channel.on("new_image", image => {
      this.setState({ images: [...this.state.images, image] })
    });
  }

  renderImages() {
    return this.state.images.map(image => {
      return <img key={image.path} src={image.path} />;
    });
  }

  render() {
    return (
      <div className="main">
        {this.renderImages()}
      </div>
    );
  }
}

export default Main;
