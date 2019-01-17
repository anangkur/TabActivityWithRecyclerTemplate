package ${packageName}

import android.databinding.DataBindingUtil
import android.os.Bundle
import android.support.design.widget.TabLayout
import android.support.v4.view.ViewPager
import android.support.v7.app.AppCompatActivity
import kotlinx.android.synthetic.main.${mainActivityLayout}.*

class ${mainActivityClass}: AppCompatActivity(){

    private lateinit var mViewBinding: ${mainActivityClass}Binding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mViewBinding = DataBindingUtil.setContentView(this, R.layout.${mainActivityLayout})
        mViewBinding.apply {
            setTabLayout(view_pager, tab_layout, 2)
        }
    }

    private fun setTabLayout(viewPager: ViewPager, tabLayout: TabLayout, numTab: Int) {
        tabLayout.setupWithViewPager(viewPager, true)
        val adapter = ViewPagerAdapter(supportFragmentManager)
        for (i in 0 until numTab) {
            val fragmentTab = ${tabFragmentClass}()
            adapter.addFragment(fragmentTab, "Tab")
        }
        viewPager.adapter = adapter
    }
}