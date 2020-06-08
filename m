Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web12.28426.1591618092213513208
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 05:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZiQBOOcQ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id g5so13394214otg.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASfhlDPlc38xrOXyTVEiYo3ow0qzc6Wt2SVVChDDZ58=;
        b=ZiQBOOcQ4tLD+vhT84vhkEv8BdGEPVovFsKrzoHEkXBEmViU36oMCWAuc3j0zEWhJh
         2s9pQ/KFud2UqR40b0+asx9UlUkK/ZiW+0ZBwqId5xjal11GZ7GFgCBQAF0hJ3zRbSuf
         Heek6jTZ8aOlDzXNsb/iPGyBwypZXM6jfd6pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASfhlDPlc38xrOXyTVEiYo3ow0qzc6Wt2SVVChDDZ58=;
        b=GM0LHM3HoG6bvXowrSgA4xCFg9bZeU5TbzyJGBdDAD9TNtnrdSBqzqJNry6VxJDcEG
         P/q4jltB8W6GLgvO6arZijKnHix4Zd9fRCKnvMSCxMIk6bvQwy4jjevl5SH4eFepWNEG
         9iVpc7QUwrlPzDIunjbfW0WREQM4KNuwDssM2qMnWbPYjvvoqXPQVoEm1koPJSKrviey
         edByBbJSV3ftYJF4Z+2jIQ5DKfdJbxCas0lP/R5rLba6iM6coEPZK0iTtK6L4tkDepeY
         Byy2+G7aKgt9KVO2qjB3QKsMy2Qw9TDowoa7QP9eTNqGcyFPXhd5FXpQcVZ6cEce82ti
         7mjQ==
X-Gm-Message-State: AOAM5307DRU3hAbATNRF8RFNoF8A4u9E06olfxLmaCN/lHwDHhPvRTdE
	4z7lN8ikewgpgJ1SRBneFkqvI0xMBsOlAGP5Kjz0cA==
X-Google-Smtp-Source: ABdhPJybQfBnHE446pL/TppvH9M0tVbm4VZsK190NQb4e6HKFRi+Dx+g+PhUQ3CGEzTRhXZUVqPN4S+/MPnckT+YICY=
X-Received: by 2002:a9d:2f05:: with SMTP id h5mr17747071otb.258.1591618091210;
 Mon, 08 Jun 2020 05:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org> <1591095894-15178-4-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1591095894-15178-4-git-send-email-sumit.garg@linaro.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 8 Jun 2020 13:08:01 +0100
Message-ID: <CAM9ZRVs7xbAbw+6tNGuU7WQsHvO8-F4AF67XYMGtqu9Wjohxtg@mail.gmail.com>
Subject: Re: [PATCH 3/4] external-arm-toolchain: Add README
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denis@denix.org>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2020 at 12:05, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Document usage details for pre-built Arm toolchains.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  .../external-arm-toolchain/README.md               | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> new file mode 100644
> index 0000000..65d1a42
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> @@ -0,0 +1,50 @@
> +Pre-built Arm toolchain recipes
> +===============================

I'd recommend saying explicitly in this readme file that info on
contributing, reporting bugs, etc can be found in the top-level
meta-arm readme file.

> +
> +Introduction
> +------------
> +This layer contains recipes for pre-built Arm toolchain recipes as follows:
> +
> +external-arm-toolchain.bb
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This recipe provides support for pre-built GNU toolchains targeting processors
> +from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> +
> +Usage
> +^^^^^
> +
> +In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> +on), a user needs to download and untar tool-set on host machine at a particular
> +installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> +in ``conf/local.conf`` in order to replace OE toolcahin with pre-built GNU-A

Typo: "toolcahin" should be "toolchain".

> +toolchain:
> +
> +TCMODE = "external-arm"
> +EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> +
> +-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> +   EXTERNAL_TOOLCHAIN = "\
> +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> +   "
> +
> +-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> +   EXTERNAL_TOOLCHAIN = "\
> +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> +   "
> +
> +Supported distros and machines
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> +meant to be distro and machine agnostic as long as one is cross-compiling for
> +Arm A-profile architecture.

This section should cover what is actually tested. For example, let's
say I have a custom distro & machine and I see some weird behaviour
from the ARM toolchain. I'd like to know which distro & machine
combination is known to be good so that I can see if it reproduces the
same errors. That would allow me to determine if the error is in
meta-arm-toolchain or if it is my own layers.

> +
> +gcc-arm-none-eabi_<version>.bb
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> +Cortex-R and Cortex-M processors.
> +
> +Supported version: 9-2019-q4-major
> --
> 2.7.4
>


-- 
Paul Barker
Konsulko Group
