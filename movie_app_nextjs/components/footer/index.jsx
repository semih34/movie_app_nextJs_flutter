import React from 'react'
import styles from "./styles.module.css"
import Link from 'next/link'


const Footer = () => {
  return (
    <footer className={styles.footer}>
      Made with kalp by&nbsp;
      <Link href="twitter" target="_blank">
        Semih YILMAZ
      </Link>
    </footer>
  )
}

export default Footer