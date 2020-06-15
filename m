Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.14973.1592218526674522372
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 03:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ymfbEgGK;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id z9so18579755ljh.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2020 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z3q7jMVI5Ztt3OedeXNIiyZlcq83MWCk9viyllXyE8A=;
        b=ymfbEgGKKTPVilgKqSSYrMo73+IYi1kWd+zlJ/acllropKeDyajrl7z/ffKLwps6Ws
         1ariIPW7ZxQyL0Ie6J2ntL48a5y6dxMncN8TPk+mUXtHp2KwexT7vsb7MnYoRVsxblzI
         lqUv905HG4MZuDYOVNyfDvBlndOg/7eaqz1r36ehHi+8mEwNPV/kEgBQomtXah4P6X4e
         0rMFUR4mMXqxlHcgAETnZao33Ov1XrCoMwSwrqvZcmsnHLMR7ICPgt1OTAF1IiGnHG90
         ej9DXFRV432bEkZHzkp0lk0eRmAMbu5eBJ3BkQjxme7L3jEFy02tTkMk5CDwveK+/JCu
         Bs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z3q7jMVI5Ztt3OedeXNIiyZlcq83MWCk9viyllXyE8A=;
        b=Cp5PjpUTNQtVGzUe2YbLqXzHi+NenAcJmsKCnujJQXSqW6WpkFdQM8NcLW+yRgUPqk
         y6Bou/1Zq3t6tM8TuT2gH4fPb/vGCt/RNnn5DXRfniZYxB2e1npK/Z9OCNmNHbeAXAYe
         39hSXlQmag1u7isk1+6RvZbQuvPt2qMX9vQtzLgUdJPWXZxrY0wnNhNF+ve8enL8sOjV
         h6R9h34kRsdNHT5A5apNEpYMBirYwHPH8vWJFm9nigSj4GhYkMPGu9q0Wip/UVMjWoGz
         PnFQOjivSk1yv/m4XQkG9O18/Q3eTHDEPq2hj53uS47wuqpENLgaZzp24s7/AHohu2ji
         zOoQ==
X-Gm-Message-State: AOAM532Gv58A7VHmd6gQKTLUPcnhfnxPks7jeOlCE3OM8s1aGT1zjdjJ
	WStZ1Zgwcp+aOqcfYKcTjNdkoq5nSt5jzZcxhZ1lxw==
X-Google-Smtp-Source: ABdhPJxsTEaka5fsaHx8MdaB2WwYTGkuXCn+03SNuTrPHlX95TTBt+7fzW+AUTiwhrlPk+Rk79IMsvjQHqLBTu8oa/Y=
X-Received: by 2002:a2e:5c47:: with SMTP id q68mr13729663ljb.30.1592218524779;
 Mon, 15 Jun 2020 03:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <1592208433-28086-1-git-send-email-denis@denix.org> <1592208433-28086-2-git-send-email-denis@denix.org>
In-Reply-To: <1592208433-28086-2-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 15 Jun 2020 16:25:13 +0530
Message-ID: <CAFA6WYMxS_tMVZOVgv_gj_e4P1BKdMRjmj9WPO9EkyAJuv1cpw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/4] external-arm-toolchain-versions: set per-components license based on version
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2020 at 13:37, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> This code is upstreamed from meta-arago layer.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../include/external-arm-toolchain-versions.inc    | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> index a89f2f0..6121adf 100644
> --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> @@ -126,6 +126,20 @@ def eat_get_bfd_version(d):
>          first_line = stdout.splitlines()[0]
>          return first_line.split()[-1]
>
> +# Licenses set for main components of the toolchain:
> +# (g)libc is always LGPL version 2 (or later)
> +# gcc has switched from GPL version 2 (or later) to version 3 (or later) after 4.2.1,
> +#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg00003.html
> +# libgcc and libstdc++ always had exceptions to GPL called Runtime Library Exception, but
> +#    it was based on GPL version 2 (or later), until new GPL version 3 (or later) exception
> +#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/2009/msg00000.html
> +#    and http://www.gnu.org/licenses/gcc-exception.html, which was several days after
> +#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
> +# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or later), according
> +#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
> +# binutils version 2.17 was the last one under GPL version 2 (or later), according
> +#    to the published releases - http://ftp.gnu.org/gnu/binutils/
> +
>  python external_arm_toolchain_version_handler () {
>      if not isinstance(e, bb.event.ConfigParsed):
>          return
> @@ -139,5 +153,19 @@ python external_arm_toolchain_version_handler () {
>      d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
>      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
>      d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> +
> +    lc_libc = "LGPL-2.1"
> +    lc_gcc = ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <= "4.2.1"]
> +    lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][eat_get_gcc_version(ld) <= "4.3.3"]
> +    lc_gdb = ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <= "6.6"]
> +    lc_bfd = ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <= "2.17"]
> +
> +    d.setVar('EAT_LIBC_LICENSE', lc_libc)
> +    d.setVar('EAT_GCC_LICENSE', lc_gcc)
> +    d.setVar('EAT_RLE_LICENSE', lc_rle)
> +    d.setVar('EAT_GDB_LICENSE', lc_gdb)
> +    d.setVar('EAT_BFD_LICENSE', lc_bfd)
> +
> +    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc, lc_rle, lc_gdb, lc_bfd))

Do we really need this dynamic computation of license based on
toolchain versions? As pre-built GNU Arm toolchains [1] only support
versions > 8.

[1] https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads

-Sumit

>  }
>  addhandler external_arm_toolchain_version_handler
> --
> 2.7.4
>
> 
