import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      titleInput: '',
      bodyInput: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.uniqueId = this.uniqueId.bind(this);
  }

  uniqueId() {
    return new Date().getTime();
  }

  handleChange(field) {
    return function(e) {
      this.setState({
        [field]: e.currentTarget.value
      });
    }.bind(this);
  }

  handleSubmit(event) {
    // debugger
    event.preventDefault();
    this.props.receiveTodo({
      id: this.uniqueId(),
      title: this.state.titleInput,
      body: this.state.bodyInput,
      done: false
    });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <h3>New Todo:</h3>
        <label>Title:
          <input onChange={this.handleChange('titleInput')} value={this.state.titleInput} />
        </label>
        <label>Body:
          <input onChange={this.handleChange('bodyInput')} value={this.state.bodyInput} />
        </label>
        <button>Create Todo!</button>
      </form>

    );
  }
}

export default TodoForm;
