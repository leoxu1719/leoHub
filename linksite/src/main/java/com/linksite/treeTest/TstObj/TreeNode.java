package com.linksite.treeTest.TstObj;

public class TreeNode<E extends Comparable<E>> {

	private E element;
	private TreeNode<E> leftChld;
	private TreeNode<E> rightChild;
	
	public TreeNode(E e){
		element = e;
	}

	public E getElement() {
		return element;
	}

	public void setElement(E element) {
		this.element = element;
	}

	public TreeNode<E> getLeftChld() {
		return leftChld;
	}

	public void setLeftChld(TreeNode<E> leftChld) {
		this.leftChld = leftChld;
	}

	public TreeNode<E> getRightChild() {
		return rightChild;
	}

	public void setRightChild(TreeNode<E> rightChild) {
		this.rightChild = rightChild;
	}
	
	
}
