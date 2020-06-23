Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.8746.1592924057182577571
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 07:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CGU0UjIE;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id t74so11855110lff.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Jun 2020 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NBjRboIYWOJ0F3OzFuQJ5L/eHg/it0clzdEy97w4nlA=;
        b=CGU0UjIENq3lKVWtbXRtWxi0szlzMWSyIkzo5qz6qKpdQKHQG787mC703q41IZAcMr
         nHEUV5gKVtw444T7nb5GBc3OQXnpQ0nRcKCAAlYPJ81Acp3nOpy1eWR4RXM0F/Z9uu3h
         /UWYnTcVVB1yZy8jJJNNawLysQjZC+1bRyTb9NSj6dnKqRFNX4I0NQUyz2HYEfOSsv60
         /WseHH/5zpGyBOA3BSkXMd34y3976bmbeCucWVyKzFOARdmDK5Bu4HzejExWprbosSQh
         KkUAFxmONqi9omYKgeO+T1+fgsFRHOVqmgJZ9CrvWldTSDsQ1iY3/pOn2wuuAYYnEuhO
         zGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NBjRboIYWOJ0F3OzFuQJ5L/eHg/it0clzdEy97w4nlA=;
        b=enhXqkJAoKUBg6zOek3eFemRLZmITLl2HmZ47Wm1fWDJgmpn4mygtzaLGNaeJFh6be
         nQX0bpdckwwyp8fWr390EUXHzEBuFQ/5x3WC2ru9Pt4+qrMPNws1UbPFwcX38dg9Opx1
         JTFNXD41BKqJw/xxRJyByfgtMMXewgJmpuV9bFGcgcCZzUgb6zLHbGUA+4CjOR2/MOa6
         OvB4OuKhDEYyNhuPDWRuoeFmlN/kHT2AQGB0xLqd/2SQgwnzPIB9Tw9B3P1OkeruD03l
         PAFSCmV9TxS+Ul+0JxMLbtLBpDyfc7jO21aOxFu/82YcB0bjuz358x+ECiDi2q2B9Y8b
         PONA==
X-Gm-Message-State: AOAM5306ajux3RR3PfR57ITi+XlzFSTWEk6Y2a+bpi/TZHX9MDS0GKdL
	HdG08GBAg1LeO16RMQqgN9he3l/xl9bRziDgC+peY3mnRpfJYQ==
X-Google-Smtp-Source: ABdhPJyYECYoO/bgcdKzjIqnVjUx9rDfdGUv8h9JX1noJcfNsFRqCOald9+s9iE6oQ7pxzEhuxnW7T7Bwrk4L849dPE=
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr12830876lfi.204.1592924055340;
 Tue, 23 Jun 2020 07:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <1592526937-38479-1-git-send-email-denis@denix.org> <1592526937-38479-6-git-send-email-denis@denix.org>
In-Reply-To: <1592526937-38479-6-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 23 Jun 2020 20:24:03 +0530
Message-ID: <CAFA6WYOARUfMH-VNv00HupdyBfAiA=6g0-if1kgWvP+u8ah4_w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 5/5] tcmode-external-arm: fixup headers location in external toolchain SDK
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2020 at 06:06, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> External toolchain compiler searches for some headers relative to the binary
> and regardless of the --sysroot value. Since headers are installed inside
> SDKTARGETSYSROOT, but the binary is inside SDKPATHNATIVE, symlink include
> directories between those two.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../conf/distro/include/tcmode-external-arm.inc               | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>

We can drop this hack once we package headers as part of
gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} as well. For details,
refer to my comment on patch #4.

-Sumit

> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index 7d5aecc..2f101fc 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -117,3 +117,14 @@ def populate_toolchain_links(d):
>              bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
>
>  require conf/distro/include/external-arm-toolchain-versions.inc
> +
> +SDK_POSTPROCESS_COMMAND_prepend = "external_arm_sdk_fixup; "
> +
> +external_arm_sdk_fixup () {
> +       tcpath="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${EAT_TARGET_SYS}"
> +       if [ -d $tcpath ]; then
> +               pushd $tcpath
> +               ln -s ${SDKTARGETSYSROOT}/include include
> +               popd
> +       fi
> +}
> --
> 2.7.4
>
> 
