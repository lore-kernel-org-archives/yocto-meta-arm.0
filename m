Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D9BCA1005
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:32:29 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.19260.1725031948561729373
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 08:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ShMoz81t;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6c32e1c263aso10936786d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725031947; x=1725636747; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUauKQ/gr63RxhTjcSTIZYxbEcCAz4JZn/tUCpbt0iQ=;
        b=ShMoz81tTVHWeaE/PdHxJ0L0aPLi8nZJt6GGbOsXZQE2JkXsY+MlERXS7WN4+kkuj6
         D8A70nEmp72+AeuhJlYS/ahUspQdmYoX6acK8KBo+PQxV1VHze09VAZYMtWjKPdpd6sR
         P3BWOjT8a5A9zclufgFPXwCFSOOn2ZqYI+ipOII0qtFdwyoal5bRBjMUn1l6zuaFLbgO
         0tSzW0vVPcia8f7oMg+XWwiD3Ysi36jKb5tRC5bt8k9QUh5FW8W/3hdVvlrMfdo38a/v
         0Nz5+4k0v/q6f2RALVGIfppRolbhRP8thwc5jCkZ2wpD5immUHwJ5EmuvqhktR3vx7D/
         WLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031947; x=1725636747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUauKQ/gr63RxhTjcSTIZYxbEcCAz4JZn/tUCpbt0iQ=;
        b=ApbMbHnEUONDmGYqnc+S799rbJ1Xvkp1yc0hX6bKKiB9nEl+ko/r8TdSMM5eOQ+GHF
         ftEWfXhwpOrJ6NvOfAqLTxkiB32o46hU6rg6vBXE4VC9iJCj763sK6INyRKjFSXv5dl3
         GZM1YY2baTeC7aaICyx4ulOygvazqnxcYQG+SOZvM+/bJz6QRg+KbPBlEZtKe0ZBRh4c
         hAzGNt44dka4eJKSEgQGGIpvPozPdA40lTbPZcYoZ0BsIew94A7o/mUZVdBnPKPAWayh
         uVZtkbS46N4NBcWpRHVJ2WHH/6LAGZ9qzWOPc5k1YxEnuvo7YGM0H+vmfJeKN33xqSqF
         ZKAg==
X-Gm-Message-State: AOJu0YwaFLPPA85m7taVbmm+g5h4XcdDzP4GRoFte/0GS2e/O0P26Ir5
	o5ye6fXhLUyaxF+pob+pWQGILrtmb2v+/1Zr8YWvvb7/VqLYr/v919dl/Ie9yfvc0pzUiVt5iJE
	=
X-Google-Smtp-Source: AGHT+IHraSmKg0j02r/uaLfboFwSUj6tluapzGWd0zje4ziHviyaIX3+X+n4HwjXatbN8jt9B7qQgQ==
X-Received: by 2002:a05:6214:5544:b0:6bb:84af:d632 with SMTP id 6a1803df08f44-6c33e630b02mr83500796d6.5.1725031947388;
        Fri, 30 Aug 2024 08:32:27 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c120b9sm15532336d6.32.2024.08.30.08.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:32:26 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:32:25 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 02/13] core-image-minimal: Use UEFI layout disk
 partitions
Message-ID: <ZtHmCdAQsuLB3sSL@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-3-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-3-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 15:32:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6039

On Thu, Aug 29, 2024 at 10:31:58AM -0600, Javier Tia wrote:
> - Use efi-disk-no-swap.wks.in disk definition to add expected UEFI disk
>   partitions configuration.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  ci/qemuarm64-secureboot.yml                                 | 6 +++---
>  .../images/core-image-minimal-uefi-secureboot.inc           | 1 +
>  meta-arm/recipes-core/images/core-image-minimal.bbappend    | 1 +
>  3 files changed, 5 insertions(+), 3 deletions(-)
>  create mode 100644 meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
>  create mode 100644 meta-arm/recipes-core/images/core-image-minimal.bbappend
> 
> diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
> index b26941e0..fdde1e79 100644
> --- a/ci/qemuarm64-secureboot.yml
> +++ b/ci/qemuarm64-secureboot.yml
> @@ -7,10 +7,10 @@ header:
>  
>  machine: qemuarm64-secureboot
>  
> -target:
> -  - core-image-base
> -
>  local_conf_header:
>    optee: |
>      IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
>      TEST_SUITES:append = " optee ftpm"
> +
> +target:
> +  - core-image-minimal
> diff --git a/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> new file mode 100644
> index 00000000..351e9030
> --- /dev/null
> +++ b/meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> @@ -0,0 +1 @@
> +WKS_FILE = "efi-disk-no-swap.wks.in"
> diff --git a/meta-arm/recipes-core/images/core-image-minimal.bbappend b/meta-arm/recipes-core/images/core-image-minimal.bbappend
> new file mode 100644
> index 00000000..46c00f00
> --- /dev/null
> +++ b/meta-arm/recipes-core/images/core-image-minimal.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'core-image-minimal-uefi-secureboot.inc', '', d)}

I don't think we want to do this.  This will only work with minimal
images (so no sato/graphics).  We're losing some of the package
testing we get on this unique machine because we're now minimal image.

This seems like it is just adding the WKS file, which should be part
of the machine config.

Thanks,
Jon


> \ No newline at end of file
> -- 
> 2.46.0
> 
> 

