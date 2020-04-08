Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.5157.1586316955432732847
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 20:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mDf2xq+O;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id g4so2979207qvo.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Apr 2020 20:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JT54MFbiJKXXmm21pRygbt/ZIG9jd+DfTwGk7SdmfBE=;
        b=mDf2xq+OlXvLrIA+7cPoyC98YD4Pj+BRjjXIBmgRWNU0Yw0NsNL/UZiXZVEajxintn
         flFd7fv7D/PvCCjEwQnq9msmhBqTOTDb96LZP3BxOQHfKvRytMI6JZdVCtFBGnxqB8kQ
         GhFV2XfY+Rs4oGDrfluvMSWnk55VtNHMwKCUb436O3b9ZahJPm6SpuwS8EGVAeAlGpiP
         EwDXskl9omVIhtUEXZ8Nn9kOiXYwPyP5pXdiAeFSC1F5CUH9/hg7bxvumC+OquPqaewf
         oO26FitRk0THeQU5jPu46p9MRqUwTps/2Im4STOUOWm/Ibvrn9aeVaN0m4g+h726YnCO
         +tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JT54MFbiJKXXmm21pRygbt/ZIG9jd+DfTwGk7SdmfBE=;
        b=kjgfO6ziD+YxJgAuhYwfj/5LYgbw2vvrE4yyAiUAq85hFXN67vZ+z8Eegp61PnrMHp
         JZfQ0BFC9rjQT4HN0uL0YsAWpiAO+g7farqB/maktqDM0zsaDRcQZYKxVBJ1UIMIFv/x
         4yq1TLQhjV1ExdEeMSnlXgPuXjuVO+3+5jU4frDy2JZoMiOh4Q0mjgrfSEoFsVaURURu
         EiKFxEVf17438ax7RTqnsSyCGBQCT5QI5G4poQ5OZMVKC1v/d5KXpRxdQJN2wvx3FSjZ
         XOsUXX1j1GqMozMfWv6UP0iAo9GtsH/f387piGVCipbGLDje6sP8eNwz+NyDn65JNIFQ
         KheA==
X-Gm-Message-State: AGi0PuZXziNtwsYoXRGrpkRlHPP6g0ja5Tx5pUaOv+ldzDW6QNlQHptw
	ZhsCLTKVnfFF4o9rGWbDwe1wXfBWTisDxA==
X-Google-Smtp-Source: APiQypIH5nj570RSXPOP+E7S/WWxltlVL9W6zuwP3wwF6nhubf/pZb+5PwJsambYHgpH4DfarcxpVA==
X-Received: by 2002:a05:6214:18c1:: with SMTP id cy1mr5600327qvb.142.1586316954297;
        Tue, 07 Apr 2020 20:35:54 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id a62sm16962444qkb.134.2020.04.07.20.35.54
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 20:35:54 -0700 (PDT)
Date: Tue, 7 Apr 2020 23:35:52 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v2 0/7] arm-autonomy: Introduce Xenguest system
Message-ID: <20200408033552.GC29748@kudzu.us>
References: <20200402170816.8818-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200402170816.8818-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2020 at 06:08:09PM +0100, Bertrand Marquis wrote:
> This patch serie is introducing the Xenguest system. It is introducing
> an image format to store a complete xen Guest inside one image file.
> The serie is adding Yocto recipes to create such images when building a
> Yocto image.
> It is also providing tools to use such images in a Xen Dom0.
> 
> Changes in v2:
> - fix error in disk add files in image-extra-class
> - fix several script errors in xenguest-mkimage
> - fix base-image handling of extended files

Pulled into the master branch

Thanks,
Jon

> 
> Bertrand Marquis (7):
>   arm-autonomy: Create xenguest-mkimage
>   arm-autonomy: Create xenguest-manager
>   arm-autonomy: Create xenguest-image class
>   arm-autonomy: Create xenguest-base-image recipe
>   arm-autonomy: Create xenguest image type
>   arm-autonomy: Create xenguest-image-extra class
>   arm-autonomy: Create xenguest-nodisk-image recipe
> 
>  meta-arm-autonomy/README.md                   |   7 +
>  .../classes/image_types_xenguest.bbclass      | 132 +++
>  .../classes/xenguest-image-extra.bbclass      | 102 +++
>  .../classes/xenguest-image.bbclass            | 187 +++++
>  .../distro/include/arm-autonomy-guest.inc     |   4 +
>  .../documentation/xenguest-manager.md         |  67 ++
>  .../documentation/xenguest-mkimage.md         | 119 +++
>  .../images/arm-autonomy-host-image-minimal.bb |   1 +
>  .../xenguest/files/xenguest-init              |  85 ++
>  .../xenguest/files/xenguest-manager           | 640 +++++++++++++++
>  .../xenguest/files/xenguest-mkimage           | 772 ++++++++++++++++++
>  .../xenguest/xenguest-base-image.bb           | 119 +++
>  .../xenguest/xenguest-manager.bb              |  52 ++
>  .../xenguest/xenguest-manager.bbappend        |   6 +
>  .../xenguest/xenguest-mkimage.bb              |  31 +
>  .../xenguest/xenguest-nodisk-image.bb         |  38 +
>  16 files changed, 2362 insertions(+)
>  create mode 100644 meta-arm-autonomy/classes/image_types_xenguest.bbclass
>  create mode 100644 meta-arm-autonomy/classes/xenguest-image-extra.bbclass
>  create mode 100644 meta-arm-autonomy/classes/xenguest-image.bbclass
>  create mode 100644 meta-arm-autonomy/documentation/xenguest-manager.md
>  create mode 100644 meta-arm-autonomy/documentation/xenguest-mkimage.md
>  create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
>  create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
>  create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
>  create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
>  create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
>  create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
>  create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb
> 
> -- 
> 2.17.1
> 

> 

