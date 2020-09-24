Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.26869.1600978067528993267
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 13:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RNDa6ISA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id n10so154811qtv.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2020 13:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1YtOIeGR7Z/VO2uCmaZ5nJ04TI5j2UMZdHUw0C875Fk=;
        b=RNDa6ISAEg7esmRAtayHvi5j0924wZlwqXxT/t0YsgLqTI0eIy5B58FToqLasmAQEh
         oqDWxrZsfGfcYjW4hUQ30Gh3izMdaa5YvQ+EsIFAeB8i9kduDnMUL8mgjQd9j6HcXzts
         wPPI3fEvk7/0qdcHZ7yODLPWHZc4c/WngU7T5Vl2HYXpx5rYMzlV6QdMLgYD6mrYiWa/
         OWtVpxS2Gq/XNpSRDgq7GVLmZDBLCwDR2iO8sNIdpUNg0fZ0gHvzVwblN7abXY0ul/M+
         lVnECy1mEMYyw79ob59pbr9zHw1a7qyoxHjaXHC9FdDw3Zuk5MDe9Dk+O13BmtJ3jDMB
         Lryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1YtOIeGR7Z/VO2uCmaZ5nJ04TI5j2UMZdHUw0C875Fk=;
        b=iDnBVVnFKP14vYvl+gxwTwIdntMIcUw2Q6k5izCV4hhxP/tm9s6EnmAl/7QkbVnC97
         g6Ekzc3mHpY73XYwv1XJqQIEzaNGcOGQ30dgaaOv3jqdUUkdBVN/E0CX5cCVhJPaWr70
         72V0kQHJ0bKkJ2g6gcpOkDbBBKp1TXltuL8HHtO77hpGAUPtvDSJZvP1FBlGm+7JeGgI
         mSc8EYU1eBMnwNx8I8tNlI6CfF6f0nh5LOVxdfvu8oV2q5gVh7KeJbKeTqvvhvD87wbQ
         hBAC6NGPjVkVnCO7j2a4yrIdszYncuB7OXTmFSg8SwWAVQXee79d1cFj/9CT+Mrqs9gY
         ZZHw==
X-Gm-Message-State: AOAM531RbaFEAlHJaDeW2CttR1zxouBRm5AFp3H7XEsAEDDFHi86jrc2
	WraYu579UAWKyHisgLME+yjebA==
X-Google-Smtp-Source: ABdhPJyCTo7Mu1LUp+ccEvXeKV3QAOFFMsY7DgShDy2Jln7EhGm850imSwkOYkHn6rv1CUUnH9rK/A==
X-Received: by 2002:ac8:36e3:: with SMTP id b32mr908997qtc.226.1600978066704;
        Thu, 24 Sep 2020 13:07:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id o188sm355060qke.83.2020.09.24.13.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 13:07:46 -0700 (PDT)
Date: Thu, 24 Sep 2020 16:07:41 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm/linux-arm64-ack: update branch to 5.4 version
Message-ID: <20200924200740.GB4275@kudzu.us>
References: <20200924121945.4074-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200924121945.4074-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2020 at 01:19:45PM +0100, Usama Arif wrote:
> android-5.4-stable branch has been deprecated.
> Update to new branch.
> 
> Change-Id: I6912005380e89cf62baf0f49404367a1492a45e3
> Signed-off-by: Usama Arif <usama.arif@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
> index 908873d..99b9b9f 100644
> --- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
> +++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
> @@ -5,7 +5,7 @@
>  require linux-arm64-ack.inc
>  
>  SRC_URI = " \
> -    git://android.googlesource.com/kernel/common.git;protocol=https;branch=android-5.4-stable \
> +    git://android.googlesource.com/kernel/common.git;protocol=https;branch=android11-5.4-lts \
>      "
>  
>  # ASB-2020-06-05_5.4-stable tag commit
> -- 
> 2.17.1
> 

> 
> 
> 

