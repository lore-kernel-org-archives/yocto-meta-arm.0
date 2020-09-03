Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web11.22418.1599162262710525399
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 12:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iAnvhGbU;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id x2so2936505ybf.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 03 Sep 2020 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b0IV7Btk5hnoaeuyoPrxX5t+d5vXt36s3FXWeIHZWxM=;
        b=iAnvhGbUdjhyT/KHBEqhBTKycrAk+2NUALqx/t5janA51MlnHXpsutOsftJRDDUW5s
         X7UXjTQ9xEaxsGDhSKL0+i5dyOWB69n2AR+mwLzG7xnEGJ3UO94pBLlxNC2+R6Kk2F5h
         pi2S580T8JgQhEH6vOmoTLbzXG0ukI/cB7X4oZbOqmDc+Kce9pMENF+4Tk9MHql0LNN8
         OyTTVTCrszWn/lZO7Zup8Jw8omVE/JHGHlc7zJkQUW/Y0HumqwGhezbdcJvSWKirHuY3
         rYiaTUaYUfKyM7DfFV0wLHjzz+LAfmsiFoSAaMqpuZsZtSMELDHFe/f6qQN3PUKhDc8U
         0gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b0IV7Btk5hnoaeuyoPrxX5t+d5vXt36s3FXWeIHZWxM=;
        b=A+ICi/ZWVJaVKt6/8wIiaS9nXvcfgLEEfwJjqYI5UIycs1Ho+LrXCnKtL2XbymTq6i
         NPLN5oxyyGnPJp7qFGrN+VSE0SQFzwo1waxuXWKHRJnhh+DJ1VYYgBD+yletxbQdBjji
         ap0R8AfgclgTdvSNtON5bUG3CCs7VXlgxG7u0K7MvcvxfePdVJjC2loUuk3ZAeVOgNEi
         ML444A8ueOlIVH6SNsUHTOdS9dh61VDXumycqZZI7vR9tgktneO/KBFThsSUS5NUjQOm
         gi43ee24WRJt8PjRjLe/8rGJ+igS8TtgXUbgjSMr6koagJWUhwLn7dLT3q97547MZ+5Y
         S8tQ==
X-Gm-Message-State: AOAM531VK7LV6470zQejEYkXEI7CiPkNt9MkmURqHjn1R1pWg2ycAo8J
	Hi303LEQ99+90TKjMEHFWN8JcOTw7QcxxrF8aJ6e5Q==
X-Google-Smtp-Source: ABdhPJxTTejVwOz9Z6tioD/IjqlyjgIAKObw6sy6Wb7+D3vn8E5kqCgV5K8/sNSGzSrpExc45N/pbKh6ikGiwsQhiy8=
X-Received: by 2002:a25:508c:: with SMTP id e134mr5433564ybb.371.1599162261746;
 Thu, 03 Sep 2020 12:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200903173618.2910-1-jon.mason@arm.com> <20200903173618.2910-2-jon.mason@arm.com>
In-Reply-To: <20200903173618.2910-2-jon.mason@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 3 Sep 2020 21:44:11 +0200
Message-ID: <CAP71Wjxc7rppRkG_VaeE7a0V1BCf7ea=sVKXXGevJ4-VvePkSQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2 2/4] arm-bsp: ARMv8-2a: Add tuning files
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 3, 2020 at 7:36 PM Jon Mason <jon.mason@arm.com> wrote:
>
> Add all the available ARMv8.2 tunings from GCC.  This belongs in
> OE-Core, but adding here so that it can be used while trying to upstream
> there.

both patches (the one about ARMv8-A big little) look good to me!

>
> Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
>  .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
>  .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
>  .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
>  .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
>  .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
>  6 files changed, 93 insertions(+)
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
>
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> new file mode 100644
> index 0000000..af4bfbe
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> @@ -0,0 +1,20 @@
> +DEFAULTTUNE ?= "cortexa75-cortexa55"
> +
> +TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
> +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +# cortexa75.cortexa55 implies crc support
> +AVAILTUNES += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> +ARMPKGARCH_tune-cortexa75-cortexa55                  = "cortexa75-cortexa55"
> +ARMPKGARCH_tune-cortexa75-cortexa55-crypto           = "cortexa75-cortexa55-crypto"
> +TUNE_FEATURES_tune-cortexa75-cortexa55               = "aarch64 crc cortexa75-cortexa55"
> +TUNE_FEATURES_tune-cortexa75-cortexa55-crypto        = "aarch64 crc crypto cortexa75-cortexa55"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa75-cortexa55"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> +BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
> +BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
> +
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> new file mode 100644
> index 0000000..58a3019
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> @@ -0,0 +1,13 @@
> +DEFAULTTUNE ?= "cortexa75"
> +
> +TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa75"
> +ARMPKGARCH_tune-cortexa75             = "cortexa75"
> +TUNE_FEATURES_tune-cortexa75          = "aarch64 cortexa75 crc crypto"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa75    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75"
> +BASE_LIB_tune-cortexa75               = "lib64"
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> new file mode 100644
> index 0000000..7c27d21
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> @@ -0,0 +1,20 @@
> +DEFAULTTUNE ?= "cortexa76-cortexa55"
> +
> +TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
> +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +# cortexa76.cortexa55 implies crc support
> +AVAILTUNES += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> +ARMPKGARCH_tune-cortexa76-cortexa55                  = "cortexa76-cortexa55"
> +ARMPKGARCH_tune-cortexa76-cortexa55-crypto           = "cortexa76-cortexa55-crypto"
> +TUNE_FEATURES_tune-cortexa76-cortexa55               = "aarch64 crc cortexa76-cortexa55"
> +TUNE_FEATURES_tune-cortexa76-cortexa55-crypto        = "aarch64 crc crypto cortexa76-cortexa55"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa76-cortexa55"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> +BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
> +BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
> +
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> new file mode 100644
> index 0000000..70f9770
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> @@ -0,0 +1,13 @@
> +DEFAULTTUNE ?= "cortexa76"
> +
> +TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa76"
> +ARMPKGARCH_tune-cortexa76             = "cortexa76"
> +TUNE_FEATURES_tune-cortexa76          = "aarch64 cortexa76 crc crypto"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa76    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76"
> +BASE_LIB_tune-cortexa76               = "lib64"
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> new file mode 100644
> index 0000000..672c8d5
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> @@ -0,0 +1,13 @@
> +DEFAULTTUNE ?= "cortexa77"
> +
> +TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa77"
> +ARMPKGARCH_tune-cortexa77             = "cortexa77"
> +TUNE_FEATURES_tune-cortexa77          = "aarch64 cortexa77 crc crypto"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa77    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77"
> +BASE_LIB_tune-cortexa77               = "lib64"
> diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> new file mode 100644
> index 0000000..04e28ee
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> @@ -0,0 +1,14 @@
> +DEFAULTTUNE ?= "neoversen1"
> +
> +TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
> +# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES += "neoversen1"
> +ARMPKGARCH_tune-neoversen1             = "neoversen1"
> +TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc crypto"
> +PACKAGE_EXTRA_ARCHS_tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
> +BASE_LIB_tune-neoversen1               = "lib64"
> --
> 2.17.1
>
> 
