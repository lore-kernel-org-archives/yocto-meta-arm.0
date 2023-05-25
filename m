Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13016C7EE2E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:50:57 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.6001.1684997455071642494
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 23:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=Ei63hDRk;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so2084076e87.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 23:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684997453; x=1687589453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vih0dmL9IIILFGqs+TpDkbv+jsuDa1rWfZRKhDTbEKg=;
        b=Ei63hDRkDnogq6IeNdG2tfAI8ArbcyzFYpU5st1eeQp8d7qYxFUH3xh8Hmletyqikb
         iK3AR2wDIEevG36wUo2PM/ko1HlSCbNqTj6pKZ846p9eTYeD6a+9IjGgLU0DvlZuvc0a
         dRYMpwisfL6Olpo09TJ8a+Md73GDP67Ion8caDV3Mse8wYzVSpefQlHGiG4Y1xGFvIpy
         g02njxiR7jk/mcAbVxq/Jux/DSntle4+HK01a8ZOhUl0pxUmsBhYmK6CU4ee28SMAO1+
         DT0mGgQ3wT8U9s6cI18fvSo3ZBFSwcSw2PgdOYz5U+ApirnJVGk3t6VbqFeKb5roezSy
         9c4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684997453; x=1687589453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vih0dmL9IIILFGqs+TpDkbv+jsuDa1rWfZRKhDTbEKg=;
        b=I/3zrzsfjjB+zxB7AVzOvt5vGoen2kpTV3hoc2pKC8bH6xx6kjnl1g2f5plpqb7eu5
         ZPqcjg2jqb7BO42C3aF615KjZ4mBZpcN6XPhJ7RIeseqGgzztLOA9DORKPE2Tk6UNBiB
         Sujj4cQOSpeKzp9oYZYXWsAEwMMJofr8w/QCw7N70VqrQ0jMnHKay//Dq/aRcHap9qZh
         cQLV8dR69znd6lDrM24Bt7Rv7BEFxOr7jdU2YMC91papVmBRxoWGT3jCFlSboACZuk88
         Br5tM78hTTlfJnVAOODvSIV3F25Wm2d7heW6XTofShILIuLSADYhXZtELqBjGRAbfoQ5
         7vPg==
X-Gm-Message-State: AC+VfDzbkAQbw+n0vHrXUqISTvVpQJhYmKySidVc7N8ooQwEqtTFrqlb
	y61Rch9pq8NYioI52qMyfXa7FQ==
X-Google-Smtp-Source: ACHHUZ6RSP6tesE1v3AdO09AYqMBYSfvu5HGKateg9paLNcIZ6rDh0O2SypcjX8VKlaUSYY4ot9ajg==
X-Received: by 2002:ac2:5dfc:0:b0:4f3:aa09:e7e8 with SMTP id z28-20020ac25dfc000000b004f3aa09e7e8mr7566306lfq.44.1684997453174;
        Wed, 24 May 2023 23:50:53 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id p11-20020a05651211eb00b004f13ca69dc8sm98733lfs.72.2023.05.24.23.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 23:50:52 -0700 (PDT)
Date: Thu, 25 May 2023 09:50:50 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/tc1: use latest kernel and u-boot
Message-ID: <ZG8FSrcpwwgRi/+D@nuoska>
References: <20230524160237.3275001-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524160237.3275001-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 06:50:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4701

Hi,

On Wed, May 24, 2023 at 11:02:36AM -0500, Jon Mason wrote:
> Drop usage of the Android kernel and legacy u-boot in favor of the
> latest of both

Which u-boot latest? The poky 2023.04 (or 2023.01), or the meta-arm 2022.10?
This patch removes 2022.04 from meta-arm.

Cheers,

-Mikko

