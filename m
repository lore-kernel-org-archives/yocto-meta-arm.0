Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A173EC41513
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:46:53 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.20165.1718801212943129542
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 05:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cBQRNdYB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.174, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6316253dc52so51423287b3.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 05:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718801211; x=1719406011; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEXpsOO7bmdtRgr0z9zw27RaRNdiAg3ndwzUX6v8xyo=;
        b=cBQRNdYBdA88Ih0JrxVwNIDaHWexUsMfR7EhGqlzTUXzW+ELzwLK9INd3/hkZCEruR
         eIXkcQzjuyntBjFeUGB90VXwRImRbPMxEA6wy5UB2GUpUnG61M1Ay3z7g1kUfq88Gwf2
         l9KSDSHVd4+83C0E5jdBKMqC1z50qVJLdils3HPrGXm8M+UFw/E+kU8sbmtd/1gTxG/A
         u6IpN5SfUuRdCWSTyPLE39M1YzgmJC4ghcO3bijEqSOiPHXWyJ4uT3rx7R8jAuwoVeto
         B8IHyLRP+JECNkr2sBe58HCXXNr13bluZM5pBaxpI/XSpine/4N0rNpitFt3ecItJa6p
         C0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718801211; x=1719406011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEXpsOO7bmdtRgr0z9zw27RaRNdiAg3ndwzUX6v8xyo=;
        b=UnH3QFGEIk1Vdqh/u4G2aLU16usyszAU/1Qd44fUkhShlhx4AYBgA/QnRqDr6jj/2Q
         SGF+6zNkSJIYDSNQl9W9w0MLnTLmMHnyqB4yCwsScDcRGbpONPWweaCesFtAXmjFZ11q
         7acKECZHuTCCLiBfsq7azPi6UDvRLBcaVW5qRFie6PwA1I3gS6uRNqwjlBbZ2/qvvcDg
         lVv34lS+rBYC18s0c0MvUEQB2zha5A/nPiAtvMKNG7zD+JZIQ2ml4aSamh78nuMEWLc0
         hU+xWtgCqbUQG2VMIOwahP9Cr2zii3q51LsS4jXWzlj+5BrfdljgE6302p58vHyOWr7a
         A3YQ==
X-Gm-Message-State: AOJu0YxjSz95Xd2ZQOuOWpj9GjUqVCZ8TFQ1KZHUKvCNejJMKVmwu9pO
	iDImcXY2Slg7L2k8v2xtRqMXUaMGWh7WdA65LOw81JYcKc1L2dg/kTyF2LbDLvRDunsY2hiE98Q
	=
X-Google-Smtp-Source: AGHT+IE2iARrG8fl6AbUhPXFoCtcMBVt1+yrDJeyWXJQj27YAf6u9UUsT7sfYbdPrwhBWzeKTh3EjA==
X-Received: by 2002:a81:be0d:0:b0:615:1a0:78ea with SMTP id 00721157ae682-63a8fddb1d1mr25069257b3.34.1718801210962;
        Wed, 19 Jun 2024 05:46:50 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311a92c0e6sm20823737b3.108.2024.06.19.05.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:46:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] arm/optee-ftpm: silence new compiler errors from GCC 14.1
Date: Wed, 19 Jun 2024 08:46:32 -0400
Message-Id: <171880119305.2085664.7260807128987194392.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240618154129.456464-1-ross.burton@arm.com>
References: <20240618154129.456464-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 12:46:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5835


On Tue, 18 Jun 2024 15:41:27 +0000, Ross Burton wrote:
> GCC 14.1 is stricter with code validation and the build now fails.
> However as upstream appear to be about to remove this source entirely from
> upstream[1] I didn't want to spend long investigating this if upstream
> changes will obsolete it, so just silence the errors for now.
> 
> [1] https://github.com/microsoft/ms-tpm-20-ref/pull/108
> 
> [...]

Applied, thanks!

[1/3] arm/optee-ftpm: silence new compiler errors from GCC 14.1
      commit: 1985604bebacab4ecbc721469d319e1a4a1de1c5
[2/3] arm-bsp/firmware-image-juno: use UNPACKDIR
      commit: 80be96437ee285611a46536d75c7f35a8afe61ec
[3/3] arm/libts: use UNPACKDIR
      commit: 981425c54e36e3414ab1abadd2c7b1f684f2c1ff

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

