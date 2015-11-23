#include "svm_standard_input.h"
#include <cstddef>

namespace cls {

SvmStandardInput::SvmStandardInput(): _svm_nodes(NULL) {
}

SvmStandardInput::~SvmStandardInput() {
    if (_svm_nodes) delete _svm_nodes;
}

svm_node* SvmStandardInput::get_svm_nodes() {
    return _svm_nodes;
}

int SvmStandardInput::init_svm_nodes(int feature_size) {
    if (!_svm_nodes) {
        _svm_nodes = new svm_node[feature_size + 32];
    }

    return 0;
}

}
