Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.7200.1594202098264359815
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 02:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=1ppge917;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id r19so2377367ljn.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Jul 2020 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7YKpKSPKkOIitUWtMOKZTT3HzGXivSJaSThEA5gDWrM=;
        b=1ppge9179RnEpBNURbL59Zn/HZv50uFadOHFs8OS1S411atd2xXWgzePEsZWY/bNzl
         TLOiZrkvM+JoR4Plowhc+xkZ/gVPFCzlLM3H0xNAny8j6SiRtsoNYfXW+5F2QHQztuI7
         ezGTbrzz93j1viCv+n4gkuKyLrAVJLJCsu9p3OGFFKm46fuEVws4qv1PlmNZiBPpnGMT
         4/qhY8dmAIzcHDXxfYEYRmmn+rgFRfURZ6HnXrgh+gtBurVpU7ryaOhROTjVuPmC45Xj
         GNOWnEC7n8kQ5KPyMHlIH/jjBtF3DZ/hZiHVXxHpGHyD5mWqov0NfVJef6AtoCFyFUdF
         Pk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7YKpKSPKkOIitUWtMOKZTT3HzGXivSJaSThEA5gDWrM=;
        b=TAhi5SpOcISXOw2W2NbQzHbhIjVvEibR/MbIRorwrDJ7pcKv+9CoOTWtC4itBstqzp
         WLpzysGSpVMbDkid+gPov8C5n+zrt2kDCDDpa/JDusKxvZYbvH2M/1rDxN0Pe5GjEWPA
         OwN7ooW6JL/gsryIjhWkw5X+EEbh4RtjGy10IWs4iCawcSYewhrND2lEMHpQMqA5d01E
         ZVj/emey81K429f5u4msbFNodh+cp8nR9T/RCoisUDisvnYFHhsq36+5ZKedj1XVvCqR
         8PQe/RwrzXeoNifEmnrs3f2ytQlcMTCqRoHp7OrsK2qjBuY9Dv4fWrdE1dewYk5p4IhM
         CpZw==
X-Gm-Message-State: AOAM5321KCuMHxDPeqIKY39LB4NkA56mHeqFHSb7bvTIB/r2gr6QUcE0
	QqvDlXCqbwsC2dfS9F9i1OVcbD+BH5i3jug0sJEvpw==
X-Google-Smtp-Source: ABdhPJx0dJfLs8eoAhpvvH9pr7OR6wkfjSFlOVDFAepXntRVes+9BqDK59NIzWuVmjNQwtIDAgirmKIlLUbETKwHZhs=
X-Received: by 2002:a2e:9a8d:: with SMTP id p13mr9232864lji.36.1594202096344;
 Wed, 08 Jul 2020 02:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200704154301.15546-1-jon.mason@arm.com>
In-Reply-To: <20200704154301.15546-1-jon.mason@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 8 Jul 2020 10:54:44 +0100
Message-ID: <CAAnfSTtWr50F13ANJbbaOZVbdNaSv_v_tVZ9hFq6FoZx9H39Dw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp: yocto-check-layer fixes
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

+1

On Mon, 6 Jul 2020 at 22:39, Jon Mason <jon.mason@arm.com> wrote:
>
> Changes necessary to get yocto-check-layer to pass
>
> Change-Id: Ie9ea5047ab1344d14a585552277fdbd6b2bc48ab
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-bsp/README.md                                     | 1 +
>  .../recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend  | 3 ++-
>  .../recipes-kernel/linux/linux-yocto-arm-platforms.inc     | 7 ++++++-
>  meta-arm/README.md                                         | 1 +
>  4 files changed, 10 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arm-bsp/README.md
>  create mode 100644 meta-arm/README.md
>
> diff --git a/meta-arm-bsp/README.md b/meta-arm-bsp/README.md
> new file mode 100644
> index 0000000..490ddca
> --- /dev/null
> +++ b/meta-arm-bsp/README.md
> @@ -0,0 +1 @@
> +See ../README.md
> diff --git a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> index 8b5120f..2c5f61a 100644
> --- a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> +++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> @@ -3,5 +3,6 @@
>  #
>  # Enable second network interface on startup
>  #
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files/juno:"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> index 4d20a91..3ddebb9 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> @@ -8,7 +8,12 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
>
>  # Arm platforms kmeta
> -SRC_URI += "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
> +SRC_URI_KMETA = "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
> +SRC_URI_append_foundation-armv8 = " ${SRC_URI_KMETA}"
> +SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
> +SRC_URI_append_juno = " ${SRC_URI_KMETA}"
> +SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
> +SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
>
>  #
>  # FVP FOUNDATION KMACHINE
> diff --git a/meta-arm/README.md b/meta-arm/README.md
> new file mode 100644
> index 0000000..490ddca
> --- /dev/null
> +++ b/meta-arm/README.md
> @@ -0,0 +1 @@
> +See ../README.md
> --
> 2.17.1
>
> 
