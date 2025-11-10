def delete_duplicates(head)
  current = head
  while current && current.next
    if current.val == current.next.val
      current.next = current.next.next
    else
      current = current.next
    end
  end
  head
end