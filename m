Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A07C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 14:00:10 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.45738.1681135203073633825
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 07:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=H9g87NhM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id kj14so3329287qvb.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 Apr 2023 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1681135202; x=1683727202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YbMd8ahK3ojyhb8v9vF9dBbt0MAIgoJfDob9K0Ko5UQ=;
        b=H9g87NhM3qHJ0WqCuWFBsOnrzHiMmnzTux42j13ITA/QuzAd1oSeo/ZQ5Yk2SgJf+M
         fRYIcDLgdtR+EoCrzvWayJDroQV1Wx8kQGyL9hAFIt3eCSCY/60rFrDn2hohSl/T40im
         w4x5W7ZAn5b2+dBYrH7XzVJ1/tANH3WZ+c3X8TXK9p9jCrJZMBzqwv0bZLYBhwR5jYoz
         9XHAhDsu4zBq+bYJp8FRsTqlUuE38/gdZO09tNDdomOT8q9RQnmJnIa/4XZq0+PzG60d
         nqwzwh+jZr+yhCfsPwiPgfhvORlhON8mgpZh2gMDOSQhjarDMYBXLK5139aQ7K5D5b4g
         hr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681135202; x=1683727202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbMd8ahK3ojyhb8v9vF9dBbt0MAIgoJfDob9K0Ko5UQ=;
        b=8DKVIsE6qz424huV1v99g+UktQBYxGsgHjKDf6tIW5y7tacHBaqSbURpwqSy7QFieN
         oLqtU1uFaYZZ/ZRGjeRg5Is60m7zjlUjfzD12H01Ea5dCDu+jUuHgSXYBXhNQY7xhmAQ
         GWXIbPKfa5/YStAazCsKNSt6Yqgsj6r65R1LQZo9Jnm74Gm7IuTVOJ1I7neQJsSlFeKC
         7kCuUGZPoL0ZCKsPfvspKlnDVzPof0vNcL5xcrJ7WUlQklzfdgZ3ZMFUPFrqCbXdxT+h
         wl04CBoIylj7Rx9ym+6bZz1Rjn/YO7eVbOX4A4cLHOXvyorEIjc6qW9R8L1UwISPbYJV
         ml9Q==
X-Gm-Message-State: AAQBX9cRGPYFLu+nA8JpJRX0YmXuFqmESQrMNj6UzjOx97EcJfhwwHQK
	CHTM8LBKBZXMmNGSK0ccDyhpmxhCrUAuqtKJaTI=
X-Google-Smtp-Source: AKy350bAl55Y2oAO8tXLsAaZYxpfRxQGnLG850aYAz2GzRuBWSoiKlsJAiQJrxwbdiNi04ttKRP/pA==
X-Received: by 2002:a05:6214:c83:b0:5b8:c53:3a9 with SMTP id r3-20020a0562140c8300b005b80c5303a9mr18593859qvr.36.1681135202102;
        Mon, 10 Apr 2023 07:00:02 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g19-20020ac870d3000000b003e4c6b2cc35sm3014122qtp.24.2023.04.10.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 07:00:01 -0700 (PDT)
Date: Mon, 10 Apr 2023 10:00:00 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 2/5] optee-os-tadevkit: add 3.20.0 version
Message-ID: <ZDQWYJr+N4npwd0v@kudzu.us>
References: <20230405232218.1563477-1-denis@denix.org>
 <20230405232218.1563477-2-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405232218.1563477-2-denis@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Apr 2023 14:00:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4570

On Wed, Apr 05, 2023 at 11:22:15PM +0000, Denys Dmytriyenko wrote:
> https://github.com/OP-TEE/optee_os/releases/tag/3.20.0
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

I had to drop this one because it was included in Adam's series, but
the rest are now in master.

Thanks,
Jon

> ---
>  .../optee/optee-os-tadevkit_3.20.0.bb         | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> new file mode 100644
> index 00000000..202caa54
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
> @@ -0,0 +1,24 @@
> +require optee-os_3.20.0.bb
> +
> +SUMMARY = "OP-TEE Trusted OS TA devkit"
> +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> +HOMEPAGE = "https://www.op-tee.org/"
> +
> +DEPENDS += "python3-pycryptodome-native"
> +
> +do_install() {
> +    #install TA devkit
> +    install -d ${D}${includedir}/optee/export-user_ta/
> +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> +    done
> +}
> +
> +do_deploy() {
> +	echo "Do not inherit do_deploy from optee-os."
> +}
> +
> +FILES:${PN} = "${includedir}/optee/"
> +
> +# Build paths are currently embedded
> +INSANE_SKIP:${PN}-dev += "buildpaths"
> -- 
> 2.25.1
> 
> 

