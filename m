Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.33188.1591631227375298099
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 08:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=HMxNR1xZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id w3so17680563qkb.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4KYlIVHdPzmQacF6g9oPVlCHCH1URswdSv3b9/BkWFw=;
        b=HMxNR1xZs57QeRU5/BGjwptJJbHVjCUELRkLg4TLQHpttXzQYoGeMJR4jRz6NS8bq/
         wlg8Kv63Wnjkpcz/BXeopdYq1yBCcs6fO0lpLlZOPqAHLqucYBtAHU104QQvabUx85I2
         qbE1puMFuY0Z6NSe2o6lIx4acS026haGnn48y3+45LlbxssIki9OgpjTTmlOWZ2k9pII
         4nF7j4KxTrNDjV92+6GY0NBaq3hSZ8Eozu/OucUX9of4u1D2OFuUs7IwLqoaUOCu3JGU
         LSK8yDMv/J9NwUbEkVk0JJRKQShLvpcJHEPspGZad+vrWUZMhD8KXB+PM11qyt73wsoq
         bD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4KYlIVHdPzmQacF6g9oPVlCHCH1URswdSv3b9/BkWFw=;
        b=BKV2HrOaKCI2/u6OOSV5Vj0g3rCJ8234vRN5rfFYRVk1U9WboXhtYI4RuzdqjSYa+u
         wsjbscnfO7tYJMje7fy7+iv9w59uO66k+DZkqPaYr9g8CkahilPqjx2ZTZnU8agGJTb5
         yDX5IO+X7531we3I0IMWRu0DfIUU1nh1wiUehwSAuO4A4K4rvZJHWMK3QH/0m3qJxPID
         mJ7lGjH8dCln3YS/NRzBSsgU1yaejD2g8lnXco8gBBcFvOuug4M2zsJexTas1CA73M6G
         KBx1iRtTyJacEm7bSgoFVXTtzeeC4UKYtTbYGk5iWZS9jTfTSP0qILQZHsxihy4oQsKw
         0oEw==
X-Gm-Message-State: AOAM530MI3hpckRWSPQ6BxPDCbYSu3muo/PweqRWd0LhNLNUdCOHx1pk
	omaBbZ4bkAiRFrCnZcLP1pl5TA==
X-Google-Smtp-Source: ABdhPJz+BfUihQIHIIE3H83KWMRb2xmyP44MU7X28HV+2U6nlNoCHhTxjTo1E70h+BNFDwoVDiP1qw==
X-Received: by 2002:a37:488c:: with SMTP id v134mr23295580qka.318.1591631226541;
        Mon, 08 Jun 2020 08:47:06 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:b9b3:35e6:b1bd:2c87])
        by smtp.gmail.com with ESMTPSA id d17sm7265981qke.101.2020.06.08.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 08:47:06 -0700 (PDT)
Date: Mon, 8 Jun 2020 11:47:04 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp, linux-linaro-arm: Don't perform SHA verification
Message-ID: <20200608154704.GB15959@kudzu.us>
References: <1591365242-62744-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1591365242-62744-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2020 at 02:54:02PM +0100, Diego Sueiro wrote:
> Since the Linaro kernel-release repo doesn't have a master branch and
> the branches are force pushed, we need to have the nobranch=1 setting
> in the SRC_URI and have the SRCREV pointing to TAG commit SHA the will
> not get modified.
> 
> Change-Id: Id1ad6b57a6f11ec4dadd3647043e6f2f48f498d4
> Issue-ID: SCM-888
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> index fcc07a6..d2cd127 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> @@ -11,10 +11,11 @@ COMPATIBLE_MACHINE ?= "invalid"
>  # KBRANCH is set to n1sdp by default as there is no master branch on the repository
>  KBRANCH = "n1sdp"
>  
> -SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;branch=${KBRANCH}; \
> +SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;nobranch=1 \
>             file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
>            "
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>  
> -SRCREV = "${AUTOREV}"
> +# Refer to commit TAG N1SDP-2020.03.26 since it will not get force pushed
> +SRCREV = "137cccb0843e63b031acf67d1ca4f6447b8c417c"
>  LINUX_VERSION ?= "${PV}"
> -- 
> 2.7.4
> 

> 

