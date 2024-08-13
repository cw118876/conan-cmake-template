#include "{{project}}/{{project}}.hpp"

#include "gtest/gtest.h"

TEST(Arithmetic, basic) {
    EXPECT_EQ({{project}}::add(1, 2), 3);
}

TEST(Arithmetic, negative) {
    EXPECT_EQ({{project}}::add(1, -1), 0);
}

class AriTest : public testing::Test {
 protected:
  void SetUp() override {}
  void TearDown() override {}
};


TEST_F(AriTest, basic) {
  EXPECT_EQ({{project}}::add(1, 2), 3);
}

TEST_F(AriTest, negative) {
  EXPECT_EQ({{project}}::add(1, -1), 0);
}