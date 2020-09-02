Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web10.16994.1599076516947395616
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 12:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BQwNduiY;
 spf=pass (domain: linaro.org, ip: 209.85.219.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f193.google.com with SMTP id x2so428168ybf.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2020 12:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Hgh6J/7MTkWgwDz1VuVOlS0QnMsOFupbS3ds94u2Yo=;
        b=BQwNduiYOyoL9FhdizF5zx9bIAk4Yq4xQ//wJuxp4DKPt+reC4QUx8yMuWD3VAibZm
         D/O9x/KamZgTdzOlwWGNP5Z/z/FdJ+XWFB6OjhYCN6Al3yCDYjXObyy+TlI1PrhZSbpX
         XBI3IACP50QvXToIaQCZvdppVauPmXa6ZOuNK8YX0idi1ZbpdXRusf8dX89nM5djOa0p
         4uWSyuccsKjOZnhZBLw8Wcc9V0nf5w4WFFzfengGAc25YdzAwlnM1FvCTlzrWKoZ80qu
         jk40PSU2EJpvTdKABfgr1E3kn7HVld/dc6Mc3OYm4lVDVcXFZpSMzFPmKyXE3t9TfpCc
         675A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Hgh6J/7MTkWgwDz1VuVOlS0QnMsOFupbS3ds94u2Yo=;
        b=jv8vP4Z+c6POkuuTQy1f+zrNWOo13FmRcy4fYpAIaQrzuS2XSaJHi89vGIHEP3XhFF
         0xY+d/Y+PC9mNIQlj9tKESiEA3rtZJjJFCc/X6y8ZpDEDouTS9oWtLAU4cdWvb/VXbTM
         5iUzaqwcSCqitMjYtwzkQ70jQrR0co5Cr01sLERVLntG8Ka3y35zw+SjOi7CKn2F/Er5
         R6c8qz6puR2d2D8/IkJG0vIkD0lm0pZph1ZXJh5sKAU+Vpe3UPVQ90fcW4enS79pg4eP
         Tg1kuDV4JF8uYPtIQJfDSV/QK7EkupOaicmj3SKNJVQaFF69Jmc33mDHUL0cpd5x2xXB
         JcKw==
X-Gm-Message-State: AOAM533uWBjMfHsqGJPxWTMWp5etuUFyi0Jn2HB74ZHk+Y5iMuTxUfWF
	4MgKkdEjGpFqJh2dQsj73792zTOrtzJaiI9fEy9fzA==
X-Google-Smtp-Source: ABdhPJzOQEg3Z2xxYMY2yvJ6GYjgaWIPgIlKXiy6V+g1qQk0gCBuu1onyycMZgwv4FVh46DVVmmWISAx4broDjJbXYE=
X-Received: by 2002:a25:e0b:: with SMTP id 11mr11554735ybo.201.1599076515929;
 Wed, 02 Sep 2020 12:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200902155320.16918-1-jon.mason@arm.com>
In-Reply-To: <20200902155320.16918-1-jon.mason@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 2 Sep 2020 21:55:04 +0200
Message-ID: <CAP71WjwFJGtzv5re3tRwKhUje9bjb3qU8QQqE5KTLVUiOar9TA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: ARMv8-2a: Add tuning files
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 2, 2020 at 5:53 PM Jon Mason <jon.mason@arm.com> wrote:
>
> Add all the available ARMv8.2 tunings from GCC.  This belongs in
> OE-Core, but adding here so that it can be used while trying to upstream
> there.

This was merged recently in OE-core:
https://git.openembedded.org/openembedded-core/commit/?id=88c79a56b4ddab61c16cd4cb7b887e7d7223d845

Shouldn't you use this ?


>
> Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../include/tune-cortexa73-cortexa35.inc      | 20 +++++++++++++++++++
>  .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
>  .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
>  .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
>  .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
>  .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
>  .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
>  7 files changed, 113 insertions(+)
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
>  create mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
>
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> new file mode 100644
> index 0000000..9e0786c
> --- /dev/null
> +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> @@ -0,0 +1,20 @@
> +DEFAULTTUNE ?= "cortexa73-cortexa35"
> +
> +TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
> +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +# cortexa73.cortexa35 implies crc support
> +AVAILTUNES += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> +ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
> +ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
> +TUNE_FEATURES_tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
> +TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "aarch64 crc crypto cortexa73-cortexa35"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa35"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> +BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
> +BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
> +
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> new file mode 100644
> index 0000000..8bc6b74
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
> +require conf/machine/include/arm/arch-armv8a.inc
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
> index 0000000..138d443
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
> +require conf/machine/include/arm/arch-armv8a.inc
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
