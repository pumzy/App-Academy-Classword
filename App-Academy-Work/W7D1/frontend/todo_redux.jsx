import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import { allTodos } from './reducers/selectors';
import Root from './components/root';

const store = configureStore();
window.store = store;
window.allTodos = allTodos(store.getState());

document.addEventListener("DOMContentLoaded", () => {
	ReactDOM.render(
		<Root store={ store } />,
		document.getElementById('content')
	);
});
