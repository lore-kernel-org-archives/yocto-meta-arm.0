Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.1017.1584650022463450655
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 13:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=WacaEcSw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id t13so3069711qtn.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2020 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jjK3ZHZq1QEeuxvxdJncMRP6t7M87JjGFaYIWdJ5w1Q=;
        b=WacaEcSwc0FbZLgBtG3Q6jU6AmYrpN7Fc7Ymr3piO/KHC+Ybe5BsQnjC54pdT9XVqR
         0+WxgjHk1IxW/Z6VhxSgcS27Cip3FRUqTaCQ0poyb1/uFBzwYx+ts2u4/BqFrYETu14F
         34XHw/ybEPyjkM8Q2+DqaxlkACIl3Cb7ytIcUjLf5O2Kj41iiZkFD/DcrxYKG16zlaMV
         yUZPXTc2RbKtqXaKU03pkZ0vK965zMe1loon1FwYndIL5wxdGNCGMxTSstfjFAL8J9Ka
         DXP22urszix0OBf7Pq96Tdlo81cz8wwcpT4iPqFt57TJVoO4MEhkoQjwQYboZJPnBNLl
         Nr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jjK3ZHZq1QEeuxvxdJncMRP6t7M87JjGFaYIWdJ5w1Q=;
        b=sMermU8a5v8JPQ5ehnWLMuDoq0nis1rswEicpBwa6t+U6XxIe6ypqHsWYXWV2yy7X6
         bd88+IYX/TAKC/H19vzBrcDaqRFSSG2EAG6OXshufMkq2YdTsqhIJt3ueg+ZDq0K39R2
         l7vdghWpaao2k+SDUM+mNZw/0vJ28CvMufSgKMToUqqEvxmzSmQJvW/SkfWwCtQV+KMq
         93YJtn21TqIl1B8KUFcE667F9NzcJPsOFtjWkTjVdzrvEFVW98jUlRfiI3hxlbfQepJo
         f3XozTlRy/Ejfl5Tcg60SZPn3z6vMlQ6LjANQpcfJqaRkXm10fTjEN1GJ5yA28tbcS3M
         YO7g==
X-Gm-Message-State: ANhLgQ1TOMXt5JCfomp+d0tau2CGQJ/4udON3/ZVbzeeT+1Cxujx4owd
	mDdcpFRy78VYFZesjWTg7r1Gv+ybn6VEFQ==
X-Google-Smtp-Source: ADFU+vtjt5Deyc6IWEReropMEaQ/p3VyTND/tf9+TgeohZBYs2NpFPSIv0zw0g7LG8CttMxyQFmMAA==
X-Received: by 2002:ac8:46d5:: with SMTP id h21mr4863646qto.59.1584650021373;
        Thu, 19 Mar 2020 13:33:41 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:4158:6bf7:f564:e8f1])
        by smtp.gmail.com with ESMTPSA id u4sm2363771qka.35.2020.03.19.13.33.40
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:33:40 -0700 (PDT)
Date: Thu, 19 Mar 2020 16:33:39 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] foundation: disable Scalable Vector Extension (SVE)
Message-ID: <20200319203338.GD27467@kudzu.us>
References: <20200318120146.24154-1-rahul.singh@arm.com>
 <6540BF0E-DAF6-4BEE-AA99-AC6FBE4D96AE@arm.com>
MIME-Version: 1.0
In-Reply-To: <6540BF0E-DAF6-4BEE-AA99-AC6FBE4D96AE@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2020 at 08:02:43AM +0000, Bertrand Marquis wrote:
> 
> 
> On 18 Mar 2020, at 12:01, Rahul Singh via Lists.Yoctoproject.Org<http://Lists.Yoctoproject.Org> <rahul.singh=arm.com@lists.yoctoproject.org<mailto:rahul.singh=arm.com@lists.yoctoproject.org>> wrote:
> 
> When foundation platform is booted with SVE enabled in linux
> kernel and with Xen hypervisor, linux kernel is stopped by a
> trap catched by Xen during early boot as Xen is configuring
> the coprocessor to trap access to SVE to EL2.Disabling the SVE
> in foundation to boot the guest and host.

Applied to the master branch of meta-arm.

Thanks,
Jon

> 
> Change-Id: I862540a46686f1fb5343a3143da61db6073bb1d3
> Signed-off-by: Rahul Singh <rahul.singh@arm.com<mailto:rahul.singh@arm.com>>
> ---
> .../recipes-devtools/fvp-common/files/start-foundation-armv8.sh | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> index 1df4fd8..e014124 100755
> --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> +++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> @@ -41,9 +41,11 @@ FOUNDATION_PLAT_EXE="Foundation_Platform"
> 
> # Foundation Platform arguments
> # 4 cores
> +# Disable Scalable Vector Extension (SVE)
> # gicv3 emulation (required for hardware virtualisation)
> FOUNDATION_PLAT_ARGS=" \
>     --cores=4 \
> +    --no-sve \
>     --gicv3"
> 
> # Foundation Platform user arguments
> --
> 2.17.1
> 
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.marquis@arm.com>>
> 

> 

