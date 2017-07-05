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
    event.preventDefault();
    this.props.createTodo({
      title: this.state.titleInput,
      body: this.state.bodyInput,
      done: false
    }).then(
      () => {
        this.props.clearErrors();
        this.setState({ titleInput: "", bodyInput: "" });
      }
    );
  }

  render() {
    let errorDiv;
    if (this.props.errors !== []) { // don't use store.getState().errors
      let errors = this.props.errors.map( (e, idx) => <li key={idx}>{e}</li> );
      errorDiv = <ul>{errors}</ul>;
    }

    return (
      <form onSubmit={this.handleSubmit}>
        <h3>New Todo:</h3>
        <label>Title:
          <input onChange={this.handleChange('titleInput')} value={this.state.titleInput} />
        </label>
        <label>Body:
          <input onChange={this.handleChange('bodyInput')} value={this.state.bodyInput} />
        </label>
        {errorDiv}
        <button>Create Todo!</button>
      </form>
    );
  }
}

export default TodoForm;
