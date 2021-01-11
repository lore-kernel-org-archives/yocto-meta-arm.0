Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.35190.1610377636960336524
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 07:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VdSho2xu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.42, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f42.google.com with SMTP id o6so18137443iob.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Jan 2021 07:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SGIggQ3tz2qM2fg/uu3tFAVOqr0u3kd2JQhF+sRXX+U=;
        b=VdSho2xuXoGEcDpM/rUpy3O78mDfU3d/zhFZKFrV0CI9LrsLD11yTTZOvG+lbGcOv6
         TTp626G0usYQuhGYY6mUNFChtvnQGCxZdsWqprP3yIvTcmKMYnJBwcEHL/lZD1L/1d3B
         1uZQnD1X/4BzEyfmc9/aPxQMb8QwXaftSuT4UJ8w+2O+mY2QJcNNZl83Tynu9k8SkKTy
         FRmTArq9AGIlrhojzGTvHw1cQUJpdN0WvKm7utyIyRWu2RSfGziebVcr8a49ZTtYX8rW
         IzrCe8iHeoSnOImgNT27sjqcJGNZbeNO8nXUsP1CLf4vt6tmZQ1JxX8FNplxOFIRQFgD
         6iPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SGIggQ3tz2qM2fg/uu3tFAVOqr0u3kd2JQhF+sRXX+U=;
        b=FDOo4Gbd3ciL5T5f1aalLI+f7jasMeyrHqO7z5gL6fEiBWe7MsJGPkWj+yR9H7oBP+
         OaQhbwX0K8wspVIGIu5yBvLO5dTKDkJTZo9wy06LN4OOR4G8YACK48/C2X/Ik+HLr2Ks
         h7225C64A06wpXW5whkeTwV/2dxRNl3dYzQD0rw5OTm/g7BfyUekKymE6i0gFrO1s+mj
         zkzHYF2oAlshQ/UA3EFwSZweqgeTq8OF0ygYt4ztzqq4fYF9fen2gDyafogPlosX0zg0
         aFwu2wdeTJNl2KRjQb9wI4tB4icGtp1r1cYpEwLRscahCelOfLucp1nd0hjV3lNqIjis
         9XVA==
X-Gm-Message-State: AOAM531McGwLZBicIh6mjTaEpen11c2gwSBqYHCXjladQgqB4pU99kzW
	f6Badi5kYmq2bbbBdy74HdMq8Q==
X-Google-Smtp-Source: ABdhPJxx96q1HcPtZAVhE+DDYu0jkJRfpZBjw1YtE1+V4+Pp19Z+MsdwScaP3e4HocLzRZsGfHTQ3w==
X-Received: by 2002:a02:a419:: with SMTP id c25mr135961jal.91.1610377636301;
        Mon, 11 Jan 2021 07:07:16 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:e94c:b6f1:fb48:cecb])
        by smtp.gmail.com with ESMTPSA id x5sm15371131ilm.22.2021.01.11.07.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 07:07:15 -0800 (PST)
Date: Mon, 11 Jan 2021 10:07:14 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Piotr <piotr.piwko@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] invalid characters in license '${EAT_GCC_LICENSE}'
Message-ID: <20210111150713.GA1084@kudzu.us>
References: <db7M.1610369317172636984.vXd0@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <db7M.1610369317172636984.vXd0@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 11, 2021 at 04:48:37AM -0800, Piotr wrote:
> Hi,
> 
> I've just updated all corresponding repositories to the latest dunfell branches, and found that there is a problem with parsing the external-arm-sdk-toolchain.bb recipe:
> 
> ERROR: /home/piotr/prj/yocto.main/build/project/../../meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb: external-arm-sdk-toolchain-arm-${EAT_VER_MAIN}: invalid characters in license '${EAT_GCC_LICENSE}'
> ERROR: Failed to parse recipe: /home/piotr/prj/yocto.main/build/project/../../meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> 
> I've analyzed that and it seems like there is missing a license.inc including, as it is done in external-arm-toolchain.bb recipe. The same issue occurs with EAT_GDB_LICENSE:
> 
> ERROR: /home/piotr/prj/yocto.main/build/project/../../meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb: external-arm-sdk-toolchain-arm-${EAT_VER_MAIN}: invalid characters in license '${EAT_GDB_LICENSE}'
> ERROR: Failed to parse recipe: /home/piotr/prj/yocto.main/build/project/../../meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> 
> Should I do something extra to make the latest branch working, or it is a bug which shall be fixed?

Can you tell us how to replicate your error?

Thanks,
Jon

> 
> Thank you in advance for help,
> 
> --
> Piotr Piwko

> 
> 
> 

