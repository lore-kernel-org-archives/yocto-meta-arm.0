Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.229.1586815412531092130
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=WrejrWvW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id ef12so5227339qvb.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Apr 2020 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V0v9OlHOLZDyrbGHpkSPpRMd8c6isoDuVylrfCsThe4=;
        b=WrejrWvWmZgb16R1xiXPEWtceQyluyd8uHCwsjy8gIB4cwqn/2UsXahsUwLDxtZTjt
         imGH11m6JDwahAZelfPDVYnIBWvAbOhTUFkJ/KiLiVsWLZSFOnFXEcGQ4PG0BTMRAovy
         j+9gSdIohFvbcYaGfgTKMWnb3Bld0tH6s39BE4Yw290wgrHqV1ScIDUDHCpgJNOrD91a
         TXU9VRJOqtWVPd6goEAPmCAQyTy5+8/bijuNm6aNGyISq+GDBnrF4oVyxIb2bODry0BB
         1KulZaOpnmNPaaXfuZjzjoCtL32uv6022mg5uB64Sg+uLFNYGGdks7oaHQ1BTacoxC8J
         qg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V0v9OlHOLZDyrbGHpkSPpRMd8c6isoDuVylrfCsThe4=;
        b=qoeZVMZpF1OhqYW/Gw6p1L2UwnI56EwKPNoVG+DT94tfBlbVqQ192am/leGZ2xFO4g
         SrYSohN3ncf6rU/pSGwgvGyMwBJzbzYPTeZVy0MJd3jhChWsINiMLBpGo3bFWwd9R9w1
         J/HmBMNpFLI1OjHunbImqH+zkZXwe59KHSogo1ll8rI50BZSV8nAt/fVh3i0QIOE8RXB
         0fyQVVA/A482rRmwitXIanUJ+OcIxo/qSPgCGnJJ9tT8aZ/8cIihe17Uk8R0dG5OYTpN
         52vDFXcEUkM2uM3rYSQnlBxJLODNQh/YKxfl6Ma0X3POAm55UulSZo6LGndzbEvW6kkZ
         S0lw==
X-Gm-Message-State: AGi0PuZpmucPW07ZbFjhkrFONNbrR4xcVkeIfn5gj/z4/xP7cAZOScJn
	+FZGeqkIr2YaKc14BnAKEPcvST0g/GIIAw==
X-Google-Smtp-Source: APiQypIi8sZNkUeba2+CjG3mE1GPQvIkkWtP7xUIsFTQtIZjL1dmiFnw5EJjjzJaNP6mCgw913WKzw==
X-Received: by 2002:a05:6214:183:: with SMTP id q3mr19723810qvr.234.1586815411523;
        Mon, 13 Apr 2020 15:03:31 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a879:c5d6:85ec:e8ee])
        by smtp.gmail.com with ESMTPSA id l189sm9346136qkd.112.2020.04.13.15.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 15:03:31 -0700 (PDT)
Date: Mon, 13 Apr 2020 18:03:29 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH] external-arm-toolchain: split and strip packages normally
Message-ID: <20200413220329.GB30105@kudzu.us>
References: <1586732634-10248-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1586732634-10248-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 12, 2020 at 07:03:54PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> In the past, some Linaro toolchain versions were shipped with already stripped
> libraries, causing QA issues, hence splitting and stripping was disabled.
> 
> This is no longer the case and it is better to split and strip binaries and
> libraries normally, generating smaller images, while retaining debug symbols
> in corresponding -dbg packages.

Pulled into the master branch.

Thanks,
Jon

> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb   | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index a5ada95..ddd3aff 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -1,8 +1,6 @@
>  require recipes-core/glibc/glibc-package.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
>  # License applies to this recipe code, not the toolchain itself
>  LICENSE = "MIT"
> -- 
> 2.7.4
> 

> 

