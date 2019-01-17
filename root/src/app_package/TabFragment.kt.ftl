package ${packageName}

import android.arch.lifecycle.Observer
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.DefaultItemAnimator
import android.support.v7.widget.LinearLayoutManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import kotlinx.android.synthetic.main.${tabFragmentLayout}.*

class ${tabFragmentClass}: Fragment(){
    private lateinit var mViewBinding: ${tabFragmentClass}Binding
    private lateinit var mAdapter: ${itemAdapterClass}
    private lateinit var mViewModel: ${viewModelClass}

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        mViewBinding = ${tabFragmentClass}Binding.inflate(inflater, container, false)
        mViewBinding.apply {
            mViewModel = ${viewModelClass}()
            mViewModel.apply {
                dummyDataLive.observe(this@${tabFragmentClass}, Observer {
                    if (it!!.isNotEmpty()) {
                        mAdapter.setRecyclerData(it)
                        swipe.isRefreshing = false
                    }
                })
            }
        }
        mViewBinding.setLifecycleOwner(this@${tabFragmentClass})
        return mViewBinding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupAdapter()
        swipe.setOnRefreshListener { mViewModel.createDummyData() }
    }

    private fun setupAdapter() {
        mAdapter = ${itemAdapterClass}()
        recycler.apply {
            adapter = mAdapter
            itemAnimator = DefaultItemAnimator()
            layoutManager = LinearLayoutManager(requireContext())
        }
    }

    override fun onStart() {
        super.onStart()
        mViewModel.createDummyData()
    }
}