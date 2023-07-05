Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B879EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:11:25 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.2237.1688580679521716086
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 11:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=kwPzXIpB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.208.181, mailfrom: jdmason@kudzu.us)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso114411281fa.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Jul 2023 11:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1688580677; x=1691172677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCYn2IUqzizlVqglMJOaXiDiE4xL8XUGpHE3oXGJ3eY=;
        b=kwPzXIpBN3LY5OeN3g9K7vhum19PGHe6cYqT7MIQlp2FlqwijBJQlLFVOqk8ty6F6p
         jTUctJgq+FXre3qUDozCt2YfFa5g7BoLdjVv/6oPy31RhIyd9FuQHn0Id1C0RdLjKOX4
         i8WXayyrhcMNl4nHnu5m86aQwSGXHmP3tfRf3p8mP+pS+nQpyJh31QRlb2w2r/xp8xLN
         D/Za6DPmxLuMVjdE4+AzLscAB4MShG73oMi/gojs+oXHZ1A+kl+5SBQ3jttsvJOJ1a2G
         Q5HCDer7cR6uVtTF4UeAlHXfpbZPk8/y0i1YQ7bNR5y/Hl+WbWAB2EeNdFh+dhEFREHx
         WGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688580677; x=1691172677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCYn2IUqzizlVqglMJOaXiDiE4xL8XUGpHE3oXGJ3eY=;
        b=dC5UW6E86PFQac5rgwO/Yni6goFYsN6DESG6E57yP+SrN8Ug0DbPMe05vLsw5tetn9
         MA9ycURew4DcS1g5nb/g+3aZmDXt80Qtd75Jwa6CMxD8HfprZzOGGK+0Eqj38U4mEq4x
         wCsgERUG+1LPCXV3bOKBNOwYkg9ukhT+E1W041mTZMWXp9TIIqi8bTtSab9ZcsakXTpE
         g5hGXlfqK1SNB+JtQRVEasoI3Vz4h5aniw83AGjSu3cA/7/NlfVU3HJr1ZGUigOdv3Qw
         JgJb5dVaj4zwxR+ZiKWCzZzlvHHHrYLQxwMAi4M8l1FMa7UvDyBbEvSfQ5d56tnCuCIW
         hiQw==
X-Gm-Message-State: ABy/qLY5VB3mzBtbj03wG3AhDwz6gfJnxScqGwtkm+RxqLfhE8XbJD+J
	n0nLB6GudMtXAKpppkD7+hyVOarLOu8L+qwlETZCOw==
X-Google-Smtp-Source: APBJJlFPpF6ZWcEPgSYWWYN+mYL2l6OAz0sgvsANNb3fcoUuEGYHZy2Yr+wJA0SAsW2jXty871gF0s6719LcMY7BqYI=
X-Received: by 2002:a05:651c:238:b0:2b6:99a3:c256 with SMTP id
 z24-20020a05651c023800b002b699a3c256mr11291161ljn.38.1688580677444; Wed, 05
 Jul 2023 11:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230705-jdm-xen-v1-1-a654df463845@arm.com>
In-Reply-To: <20230705-jdm-xen-v1-1-a654df463845@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 5 Jul 2023 14:11:06 -0400
Message-ID: <CAPoiz9zwq3N71BYH9-METn+Q1PErKABEdd3PSqEeo3bW66q3iQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ci: xen guest and host testing
To: jon.mason@arm.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jul 2023 18:11:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4857

DISREGARD this email.  It is a test using b4 to send without an SMTP server

On Wed, Jul 5, 2023 at 2:10=E2=80=AFPM Jon Mason <jon.mason@arm.com> wrote:
>
> From: Jon Mason <jon.mason@arm.com>
>
> Add the ability to run testimage on xen guest images (not xen testing),
> and add xen host testimage for qemuarm.
> NOTE: xen yml files must come after testing yml file due to the order of
> the sshd entry (and xen requires openssh).
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
> b4 test email
> ---
>  .gitlab-ci.yml                                      | 9 +++++----
>  ci/xen-guest.yml                                    | 7 +++++++
>  ci/xen.yml                                          | 2 ++
>  meta-arm/recipes-kernel/linux/files/xen-nopci.cfg   | 7 +++++++
>  meta-arm/recipes-kernel/linux/linux-yocto%.bbappend | 2 ++
>  5 files changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 1433d2ac43c3..8f5312c35998 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -82,15 +82,15 @@ update-repos:
>  #
>  # Build stage, the actual build jobs
>  #
> -# Available options for building are
> +# Available options for building are (VIRT _must_ be last for ssh overri=
de)
>  #  DISTRO: [poky, poky-tiny]
>  #  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
>  #  TOOLCHAINS: [gcc, clang, external-gccarm]
>  #  TCLIBC: [glibc, musl]
>  #  FIRMWARE: [u-boot, edk2]
>  #  TS: [none, trusted-services]
> -#  VIRT: [none, xen]
>  #  TESTING: testimage
> +#  VIRT: [none, xen, xen-guest]
>
>  corstone500:
>    extends: .build
> @@ -180,7 +180,7 @@ qemuarm64:
>          TESTING: testimage
>        - DISTRO: poky-tiny
>          TESTING: testimage
> -      - VIRT: xen
> +        VIRT: [none, xen, xen-guest]
>
>  qemuarm-secureboot:
>    extends: .build
> @@ -204,7 +204,7 @@ qemuarm:
>          TESTING: testimage
>        - DISTRO: poky-tiny
>          TESTING: testimage
> -      - VIRT: xen
> +        VIRT: [none, xen, xen-guest]
>
>  qemuarmv5:
>    extends: .build
> @@ -213,6 +213,7 @@ qemuarmv5:
>        - DISTRO: poky
>          KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
>          TESTING: testimage
> +        VIRT: [none, xen, xen-guest]
>        - DISTRO: poky-tiny
>          TESTING: testimage
>
> diff --git a/ci/xen-guest.yml b/ci/xen-guest.yml
> new file mode 100644
> index 000000000000..d53eb4d09d52
> --- /dev/null
> +++ b/ci/xen-guest.yml
> @@ -0,0 +1,7 @@
> +header:
> +  version: 11
> +  includes:
> +    - ci/xen.yml
> +
> +target:
> +  - xen-guest-image-minimal
> diff --git a/ci/xen.yml b/ci/xen.yml
> index f4a8f9a453ad..a68eebfe5589 100644
> --- a/ci/xen.yml
> +++ b/ci/xen.yml
> @@ -6,6 +6,8 @@ header:
>  local_conf_header:
>    meta-virt: |
>      DISTRO_FEATURES:append =3D " virtualization xen"
> +  sshd: |
> +    IMAGE_FEATURES:append =3D " ssh-server-openssh"
>
>  target:
>    - xen-image-minimal
> diff --git a/meta-arm/recipes-kernel/linux/files/xen-nopci.cfg b/meta-arm=
/recipes-kernel/linux/files/xen-nopci.cfg
> new file mode 100644
> index 000000000000..043c74295022
> --- /dev/null
> +++ b/meta-arm/recipes-kernel/linux/files/xen-nopci.cfg
> @@ -0,0 +1,7 @@
> +CONFIG_PCI=3Dn
> +CONFIG_PCI_HOST_GENERIC=3Dn
> +CONFIG_HOTPLUG_PCI=3Dn
> +CONFIG_PCIEPORTBUS=3Dn
> +CONFIG_PCI_MSI=3Dn
> +
> +CONFIG_PERF_EVENTS=3Dn
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
> index 3f2c83fd624f..7234c196255b 100644
> --- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
> +++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
> @@ -36,6 +36,8 @@ SRC_URI:append:qemuarm =3D " \
>      file://efi.cfg \
>      file://qemuarm-phys-virt.cfg \
>      "
> +SRC_URI:append:qemuarm =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'xe=
n', 'file://xen-nopci.cfg', '' , d)}"
> +KERNEL_FEATURES:remove:qemuarm =3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'xen', 'features/drm-bochs/drm-bochs.scc', '' , d)}"
>
>  FFA_TRANSPORT_INCLUDE =3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm=
-ffa', 'arm-ffa-transport.inc', '' , d)}"
>  require ${FFA_TRANSPORT_INCLUDE}
>
> ---
> base-commit: c2d0905b51ff267839d1482640d913ccfa3bae63
> change-id: 20230705-jdm-xen-c783ce5e2acd
>
> Best regards,
> --
> Jon Mason <jon.mason@arm.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4856): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4856
> Mute This Topic: https://lists.yoctoproject.org/mt/99970245/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/leave/7218881/3616=
920/1111825316/xyzzy [jdmason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

