Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F280C3DA49
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 03:12:25 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.34771.1722395535283851687
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jul 2024 20:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lprfYvUJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a20b8fa6dcso13596085a.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 20:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1722395534; x=1723000334; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4ubRpJV+KlCTqqhT1COeqm2VOW91aAGrfBhykX3CiI=;
        b=lprfYvUJPdTeC1Gwirg4f9DV+pdJXKJ9tzDNURBABvPVpKZt2Y+SZgB+Ka5wKOTcd3
         n/4YmfgZRqmKCV3kLE2wTKW82DiHyA5R0RlU/pK2G4PKsO+C+4KZQPRG9kF0k5kyrgj/
         2+DTvc28FCIoXm0Bj8lp20rctsJmVM2f3GVS68D0vQRjVq0Rs0XBzLTVg5PhVE83DWZC
         vIgsDIxOG6gunfatl6tcO6pThQy4mEid+MiTHWMmty4gLbKpNggY30NVvdwjfGKv12WJ
         epZcUwl/X1hBIIaaQ9o5KB0nmKW6kiG1iT5I62N8b7w25tnuvR5AhdpZLO+ow0sM7y2r
         hpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722395534; x=1723000334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4ubRpJV+KlCTqqhT1COeqm2VOW91aAGrfBhykX3CiI=;
        b=NkSn/ZyQ/C/CCnxtBcOkdvRKSTunDe2ZAf3rRsVC3SoeYJgpTJlBL1H242dmreuvgZ
         GVFiUs461w5TiShwdh1P/tLjWUAKzPJWMI0EDtv/lU4uWQd4c02bd32JEVwfq7qGYCrH
         C+OZglq+PHHzAxwPRXW7tfwRn92/6ah287kg0jmmm4XSWH8822UsOx9/6RrAyNaBmb+K
         UMYoACBiZMS3Z2QJ6ProYl+klvylbXziEEezLe3JH8r+Mu4I7katfBb4QNfykSfmp8aV
         fPuieJkJOXOxmzUxRsHZtWKjgQlf8xxhryp2i0DMEtDbY+WveMxCT8a1t7Jxx1VscHSH
         qPKQ==
X-Gm-Message-State: AOJu0Yz96oM2lYNucYnEk9FZc2lCDvTaDrucAFRYppNNviDuTg2PbY1Y
	dpwD+9SQWQPrYGvMZilPzsFUPkBMpKhV4Uxa455ZsDsYfxMxky4uRfelvoovwQ==
X-Google-Smtp-Source: AGHT+IFlKYD+SS/6HtrihNYcLt5oz4Y8IG/GLYGuHalWWBsWuQswnfB1isEmMqsuBTXde7D3/ebJdA==
X-Received: by 2002:a05:620a:1a9e:b0:7a2:c2a:c9f8 with SMTP id af79cd13be357-7a20c2acbebmr48444485a.1.1722395534090;
        Tue, 30 Jul 2024 20:12:14 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1f9149e2esm220567485a.17.2024.07.30.20.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 20:12:13 -0700 (PDT)
Date: Tue, 30 Jul 2024 23:12:12 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/4] optee-os: asm debug prefix fixes
Message-ID: <ZqmrjL-EKud5PJSn@kudzu.us>
References: <20240718134152.38721-1-mikko.rapeli@linaro.org>
 <ZqizD72goWGzQjGw@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqizD72goWGzQjGw@nuoska>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 03:12:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5932

On Tue, Jul 30, 2024 at 12:31:59PM +0300, Mikko Rapeli wrote:
> Hi,
> 
> Is there something in these patches that is not ok for merging?

Sorry for the delay.

Something in CI was breaking and I was trying to isolate it to the
individual patches, but the CI I'm running that is publicly available
has been having issues (which I think are now resolved) and the
internal one has been bogged down with a large number of reviews.

v2 that you just sent is now in master-next and hopefully will be
happy when I get up tomorrow morning.

Thanks,
Jon

> 
> I'm following up the build paths patch with upstream.
> 
> Cheers,
> 
> -Mikko
> 

