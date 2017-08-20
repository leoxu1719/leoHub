package com.linksite.treeTest.services;


import static org.mockito.Mockito.RETURNS_DEEP_STUBS;

import java.util.Iterator;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.hibernate.loader.custom.Return;
import org.omg.CORBA.Current;

import com.linksite.treeTest.TstObj.TreeNode;

public class BinaryTree<E extends Comparable<E>> extends AbstractTree<E>{

	protected TreeNode<E> root;
	protected int size = 0;

	public void BinaryTree(){
		
	}
	
	public void BinaryTree(E[] objs){
		for(int i = 0; i<objs.length;i++){
			insert(objs[i]);
		}
	}

	@Override
	public boolean search(E e) {
		
		TreeNode<E> current = root;
		while(current != null){
			if(e.compareTo(current.getElement())<0){
				current = current.getLeftChld();
			}else if(e.compareTo(current.getElement())>0){
				current = current.getRightChild();
			}else{
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean insert(E e) {
	
		if(root == null){
			root = createTreeNode(e);
		}else{
			TreeNode<E> parent = null;
			TreeNode<E> current = root;
			while(current != null){
				if(e.compareTo(current.getElement())<0){
					parent = current;
					current = current.getLeftChld();
				}else if(e.compareTo(current.getElement())>0){
					parent = current;
					current = current.getRightChild();
				}else{
					return false;
				}
			}
			
			if(e.compareTo(parent.getElement())< 0){
				parent.setLeftChld(createTreeNode(e));
			}else{
				parent.setRightChild(createTreeNode(e));
			}
			
		}
		size++;
		return true;
	}

	@Override
	public void deleted(E E) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void inorder() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void preorder() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postorder() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getSize() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Iterator iterator() {
		// TODO Auto-generated method stub
		return null;
	}
	

	public TreeNode<E> createTreeNode(E e){
		return new TreeNode<E>(e);
	}


	
	
}
