Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E5DCDD55F
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 23:18:27 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.7270.1726701499994660319
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Sep 2024 16:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=E5y798yh;
 spf=pass (domain: linaro.org, ip: 209.85.222.46, mailfrom: javier.tia@linaro.org)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-846c5c2a8e9so58218241.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Sep 2024 16:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726701499; x=1727306299; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/oQWdfFx/60OVIXkdK6gSkY1Q7acRODBK29ZLFU2/Kk=;
        b=E5y798yhdj1047WhNIJyvzbcjy0BSTpZ5TSie352CAXjhHsB6isDMKpgZQv83bxq3i
         /uxXHOgCc1ZRiBo11jwXvXYtrxaMD+2JurRPtTsUgaEQlvQjz3nGIB5kzWF6iU4e0fl+
         S3G97Dg+ai2NJ4/CH+/SZGMw/1sO/IpLpcmSR4Sc+LivKSmp5ghsF5VIq3R8WFoXpU69
         9lvNRXtFs/swXhzRR2E9mTj4ajmKRZ9e87jhFs0WeS1ULGLnQW8j7FkND+e/3DDczUsB
         Qhx7CpEnja3pLCyV/uxJ0ZvOI3u0swwdQXC53EoMpIRMP260oFI6ZwFMyGG2PDBJF3uC
         Z8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726701499; x=1727306299;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oQWdfFx/60OVIXkdK6gSkY1Q7acRODBK29ZLFU2/Kk=;
        b=qMERkStijmAtBSs43L3ttCaGHezXKoQqGavJRWNHIaGFHkUFRATkOF554KD/O6k/R+
         WgVTPzxa7ufGnJGIw2r0AmNDNo67t87OVmXQg1LDoKjAyr3jBCiuKtnkLu2kbNuY3ARV
         FtgevmKIe2CdNSP5kTARHwLMigPN6FPLccXUVpQbIqmJjbIaLNqh5dUsS5Fze/87JAxK
         MOWRN1Y312C9xlCbXn0exwOtX84W8IyLCpS97yhVoXVa3h1+HXXp5W/DhEYRH1GWDSxG
         b1iZN0pm/V1H0IKlig9RUuABGGV9pV7Sgsve6U7CbuDAYbT1yptTI7WKfD+EDZ+GIIIi
         +Lag==
X-Gm-Message-State: AOJu0YxULIgohKXwY9QlRTSSN1ax09Lj6SwDTF4i6JyAneqlsSC7ckeU
	KfycnkqCveOv6LeIyZlHhze0PPOUkrfbMFHnfJ4KuLgq95mC1IeJngVl04Ekp0M=
X-Google-Smtp-Source: AGHT+IHAQJQ0z/LHe+IemyIYpK/eWmv/8EeqfCRz3PBGZSIky2po57P527i0NpZvZim7D3F8zBzpRQ==
X-Received: by 2002:a05:6102:c0d:b0:49c:1060:78b5 with SMTP id ada2fe7eead31-49d4145ac27mr15786880137.4.1726701498783;
        Wed, 18 Sep 2024 16:18:18 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-49e6b47a782sm1474848137.30.2024.09.18.16.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 16:18:18 -0700 (PDT)
Message-ID: <6c0a2583-c688-483c-87c5-bc7d59eeed01@linaro.org>
Date: Wed, 18 Sep 2024 17:18:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] qemuarm64-secureboot: Enable UEFI Secure Boot
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
 Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
References: <20240904224349.108885-1-javier.tia@linaro.org>
 <20240904224349.108885-3-javier.tia@linaro.org> <ZurpUsLg_312TYpO@kudzu.us>
From: Javier Tia <javier.tia@linaro.org>
Content-Language: en-US, es-MX
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <ZurpUsLg_312TYpO@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Sep 2024 23:18:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6082

Hi,

On 9/18/24 8:53 AM, Jon Mason wrote:
> On Wed, Sep 04, 2024 at 04:43:49PM -0600, Javier Tia wrote:
>> Encapsulate all UEFI Secure Boot required settings in one Kas
>> configuration file.
>>
>> Introduce SBSIGN_KEYS_DIR variable where UEFI keys will be generated
>> to sign UEFI binaries.
>>
>> Introduce uefi-secureboot machine feature, which is being used to
>> conditionally set the proper UEFI settings in recipes.
>>
>> Replace Grub bootloader with systemd-boot, which it makes easier to
>> enable Secure Boot.
>>
>> Advantages using systemd as Init Manager:
>>
>> - Extending secure boot to userspace is a lot easier with systemd than
>> with sysvinit where custom scripts will need to be written for all use
>> cases.
>>
>> - systemd supports dm-verity and TPM devices for encryption usecases out
>> of the box. Enabling them is a lot easier than writing custom scripts
>> for sysvinit.
>>
>> - systemd also supports EUFI signing the UKI binaries which merge kernel,
>> command line and initrd which helps in bringing secure boot towards
>> rootfs.
>>
>> - systemd offers a modular structure with unit files that are more
>> predictable and easier to manage than the complex and varied scripts
>> used by SysVinit. This modularity allows for better control and
>> customization of the boot process, which is beneficial in Secure Boot
>> environments.
>>
>> Add one test to verify Secure Boot using OE Testing infraestructure:
>>
>> $ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml
>> ...
>> RESULTS - uefi_secureboot.UEFI_SB_TestSuite.test_uefi_secureboot: PASSED (0.62s)
>> ...
>> SUMMARY:
>> core-image-base () - Ran 73 tests in 28.281s
>> core-image-base - OK - All required tests passed (successes=19, skipped=54, failures=0, errors=0)
>>
>> Signed-off-by: Javier Tia <javier.tia@linaro.org>
>> ---
>>   ci/qemuarm64-secureboot.yml                   |  1 +
>>   ci/uefi-secureboot.yml                        | 34 +++++++++++++++++++
>>   .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 ++++++++++++++++
>>   3 files changed, 64 insertions(+)
>>   create mode 100644 ci/uefi-secureboot.yml
>>   create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
>>
>> diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
>> index b26941e0..7866adbb 100644
>> --- a/ci/qemuarm64-secureboot.yml
>> +++ b/ci/qemuarm64-secureboot.yml
>> @@ -4,6 +4,7 @@ header:
>>     version: 14
>>     includes:
>>       - ci/base.yml
>> +    - ci/uefi-secureboot.yml
>
> I don't think we want this.  What I think we want is to keep this file
> as-is, then use the uefi-secureboot.yml as an add on.  Using the kas
> line above, it would be:
> $ kas build ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml

After reading your first comment in previous email, I initially understood using uefi-secureboot as an add-on. However, when I added the entire command, I thought it would become redundant because the qemuarm64-secureboot.yml file already contains the word "secureboot." In this case, I suppose the meaning of "secureboot" is unique to optee.

I will follow your comment to call uefi-secureboot.yml an add-on from kas tool in the next patch series.

> Then, we would want to modify .gitlab-ci.yml with something like:
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 7568c25e9d13..075e523c7d29 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -117,6 +117,7 @@ update-repos:
>   #  TCLIBC: [glibc, musl]
>   #  FIRMWARE: [u-boot, edk2]
>   #  TS: [none, trusted-services]
> +#  UEFISB: [none, uefi-secureboot]
>   #  VIRT: [none, xen]
>   #  TESTING: testimage
>   #  SECUREDEBUG: [none, secure-debug]
> @@ -274,6 +275,7 @@ qemuarm64-secureboot:
>           TOOLCHAINS: [gcc, clang]
>           TCLIBC: [glibc, musl]
>           TS: [none, qemuarm64-secureboot-ts]
> +        UEFISB: [none, uefi-secureboot]
>           TESTING: testimage
>         - KERNEL: linux-yocto-dev
>           TESTING: testimage
>
> When this is added, it'll be built and checked with our Gitlab CI.
> Honestly, I think this is the only thing keeping it from being
> included (unless Ross has additional feedback).
>
> Thanks,
> Jon
>
>>
>>   machine: qemuarm64-secureboot
>>
>> diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
>> new file mode 100644
>> index 00000000..d65beed3
>> --- /dev/null
>> +++ b/ci/uefi-secureboot.yml
>> @@ -0,0 +1,34 @@
>> +# yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
>> +
>> +header:
>> +  version: 14
>> +  includes:
>> +    - ci/meta-openembedded.yml
>> +    - ci/meta-secure-core.yml
>> +
>> +local_conf_header:
>> +  uefi_secureboot: |
>> +    SBSIGN_KEYS_DIR = "${TOPDIR}/sbkeys"
>> +    BB_ENV_PASSTHROUGH_ADDITIONS = "SBSIGN_KEYS_DIR"
>> +
>> +    # Detected by passing kernel parameter
>> +    QB_KERNEL_ROOT = ""
>> +
>> +    # kernel is in the image, should not be loaded separately
>> +    QB_DEFAULT_KERNEL = "none"
>> +
>> +    WKS_FILE = "efi-disk-no-swap.wks.in"
>> +    KERNEL_IMAGETYPE = "Image"
>> +
>> +    MACHINE_FEATURES:append = " efi uefi-secureboot"
>> +
>> +    EFI_PROVIDER = "systemd-boot"
>> +
>> +    # Use systemd as the init system
>> +    INIT_MANAGER = "systemd"
>> +    DISTRO_FEATURES:append = " systemd"
>> +    DISTRO_FEATURES_NATIVE:append = " systemd"
>> +
>> +    IMAGE_INSTALL:append = " systemd systemd-boot util-linux coreutils efivar"
>> +
>> +    TEST_SUITES:append = " uefi_secureboot"
>> \ No newline at end of file
>> diff --git a/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py b/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
>> new file mode 100644
>> index 00000000..9e47ea8d
>> --- /dev/null
>> +++ b/meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
>> @@ -0,0 +1,29 @@
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +from oeqa.runtime.case import OERuntimeTestCase
>> +from oeqa.core.decorator.oetimeout import OETimeout
>> +
>> +
>> +class UEFI_SB_TestSuite(OERuntimeTestCase):
>> +    """
>> +    Validate Secure Boot is Enabled
>> +    """
>> +
>> +    @OETimeout(1300)
>> +    def test_uefi_secureboot(self):
>> +        # Validate Secure Boot is enabled by checking
>> +        # 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot.
>> +        # The GUID '8be4df61-93ca-11d2-aa0d-00e098032b8c' is a well-known
>> +        # identifier for the Secure Boot UEFI variable. By checking the value of
>> +        # this variable, specifically
>> +        # '8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot', we can determine
>> +        # whether Secure Boot is enabled or not. This variable is set by the
>> +        # UEFI firmware to indicate the current Secure Boot state. If the
>> +        # variable is set to a value of '0x1' (or '1'), it indicates that Secure
>> +        # Boot is enabled. If the variable is set to a value of '0x0' (or '0'),
>> +        # it indicates that Secure Boot is disabled.
>> +        cmd = "efivar -d -n 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot"
>> +        status, output = self.target.run(cmd, timeout=120)
>> +        self.assertEqual(output, "1", msg="\n".join([cmd, output]))
>> --
>> 2.46.0

» Javier Tia 🖋

