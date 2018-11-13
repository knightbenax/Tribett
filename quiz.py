from cryptography.fernet import Fernet

key = 'TluxwB3fV_GWuLkR1_BzGs1Zk90TYAuhNMZP_0q4WyM='

# Oh no! The code is going over the edge! What are you going to do?
#b'gAAAAABb4WZ8BENKiOyCUNkPQrQTjI4KqFyoq95wnGZsNPVp0hiSOb_OUtHbmmik3x-FeAQkhotbtQA7Mkg0UpQ7tVRfCWxPumKA1WsvKYdlWcLTvh98_Ht3FUKFTesaS5Kk9yNw9wLnzDjE9ux57REUj1hGVnJU51JKBU4mRtEqT7GiGQo_Wp0D3tu6OmWhJZU0HoaLbhsZ'
message = b'gAAAAABb4WZ8BENKiOyCUNkPQrQTjI4KqFyoq95wnGZsNPVp0hiSOb_OUtHbmmik3x-FeAQkhotbtQA7Mkg0UpQ7tVRfCWxPumKA1WsvKYdlWcLTvh98_Ht3FUKFTesaS5Kk9yNw9wLnzDjE9ux57REUj1hGVnJU51JKBU4mRtEqT7GiGQo_Wp0D3tu6OmWhJZU0HoaLbhsZ'

def main():
    f = Fernet(key)
    print(f.decrypt(message))


if __name__ == "__main__":
    main()
