package com.demo;

/**
 * A class that represents a "paged result" of data out of a larger set, ie.
 * a list of objects together with info to indicate the starting row and
 * the full size of the dataset.
 */
public class PaginationResult
    implements java.io.Serializable
{
    private static final long serialVersionUID = 8766771253773009362L;

    private long totalSize;
    private java.lang.Object[] data;

    /**
     * Create an object representing a sublist of a dataset.
     *
     * @param totalSize is the total number of matching rows available.
     * @param data is a list of consecutive objects from the dataset.
     */
    public PaginationResult(
        java.lang.Object[] data,
        long totalSize)
    {
        this.data = data;
        this.totalSize = totalSize;
    }

    /**
     * Returns the number of items in the entire result.
     *
     * @return the total size of items.
     */
    public long getTotalSize()
    {
        return this.totalSize;
    }

    /**
     * Sets the total size of this pagination's complete set.
     *
     * @param totalSize the total size of objects contained in the complete set.
     */
    public void setTotalSize(long totalSize)
    {
        this.totalSize = totalSize;
    }

    /**
     * Return the array of objects held by this pagination rules, which
     * is a continuous subset of the full dataset.
     */
    public java.lang.Object[] getData()
    {
        return this.data;
    }

    /**
     * Sets the data for this pagination result.
     *
     * @param data the subset of paginated data.
     */
    public void setData(java.lang.Object[] data)
    {
        this.data = data;
    }
}