require 'test_helper'

class DirectoryTest < Minitest::Test
  def test_of_As
    result_pair = ->str{
      [
        Pathname.new(str).send(:directory?),
        FasterPath.directory?(str)
      ]
    }
    assert_equal( *result_pair.("aa/a//a")                 )
    assert_equal( *result_pair.("/aaa/a//a")               )
    assert_equal( *result_pair.("/aaa/a//a/a")             )
    assert_equal( *result_pair.("/aaa/a//a/a")             )
    assert_equal( *result_pair.("a//aaa/a//a/a")           )
    assert_equal( *result_pair.("a//aaa/a//a/aaa")         )
    assert_equal( *result_pair.("/aaa/a//a/aaa/a")         )
    assert_equal( *result_pair.("a//aaa/a//a/aaa/a")       )
    assert_equal( *result_pair.("a//aaa/a//a/aaa////")     )
    assert_equal( *result_pair.("a/a//aaa/a//a/aaa/a")     )
    assert_equal( *result_pair.("////a//aaa/a//a/aaa/a")   )
    assert_equal( *result_pair.("////a//aaa/a//a/aaa////") )
  end


  def test_of_Bs
    result_pair = ->str{
      [
        Pathname.new(str).send(:directory?),
        FasterPath.directory?(str)
      ]
    }
    assert_equal( *result_pair.(".")                        )
    assert_equal( *result_pair.(".././")                    )
    assert_equal( *result_pair.(".///..")                   )
    assert_equal( *result_pair.("/././/")                   )
    assert_equal( *result_pair.("//../././")                )
    assert_equal( *result_pair.(".///.../..")               )
    assert_equal( *result_pair.("/././/.//.")               )
    assert_equal( *result_pair.("/...//../././")            )
    assert_equal( *result_pair.("/..///.../..//")           )
    assert_equal( *result_pair.("/./././/.//...")           )
    assert_equal( *result_pair.("/...//.././././/.")        )
    assert_equal( *result_pair.("./../..///.../..//")       )
    assert_equal( *result_pair.("///././././/.//...")       )
    assert_equal( *result_pair.("./../..///.../..//././")   )
    assert_equal( *result_pair.("///././././/.//....///")   )
  end


  def test_of_Cs
    result_pair = ->str{
      [
        Pathname.new(str).send(:directory?),
        FasterPath.directory?(str)
      ]
    }
    assert_equal( *result_pair.("http://www.example.com")   )
    assert_equal( *result_pair.("foor for thought")         )
    assert_equal( *result_pair.("2gb63b@%TY25GHawefb3/g3qb"))
  end
end
