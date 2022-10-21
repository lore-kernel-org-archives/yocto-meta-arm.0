Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CF6C3A59D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 22:07:30 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.674.1666390044363834800
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 15:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=fY072y1v;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id z30so2909715qkz.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 15:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oSRDQHR4temNEQStXxg52zcDz+soSrcigh7iX4CpSU=;
        b=fY072y1vF8sPxEc7jL8azF07sPP2TDESyU0IYCUaNnIEEuhgjSPqL4hLR5EyfHl9LS
         fyePrfMl6Kc35t0ZsVf8Ft0KnOLh2pp7Z271l7ROG+xsYNRd7DZqNAJuAp2J5SWe7U9V
         JCtDnwiSYn1dJqLeL0na1UQ/3Gzunf4swyPyQGdLzpMKB46tw2EpMLgfh4SvD2MRxR+Z
         PoiY3y5CDm6zvEsAX0Gqmr0/GTmxNmfAWqThEOouQz8C9pA1HHNO9mlwV3RVDTb2wh7H
         xxqIBRj73KgEpJNJWm3UFI33+rjjwi3V/MTrxstzq3J1uFoCEFVdTzypndZnncIcd7Bf
         Qr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oSRDQHR4temNEQStXxg52zcDz+soSrcigh7iX4CpSU=;
        b=AGjMLrR6mc3Z42PvhK/dvWjAS9lA+f79DRZe4fGNdstUgt2BqgIk/PIzjAG1INToc1
         yFeFjfrEG1Xr7TaHNLFVIX9OhOrYoJOnuKilF3aYlaCth1mLrfgZRtX0YSrj5KdSr6gt
         Vhj3ttH+/BsWugZm3Qi1E1hEEVIlyA/wZu4iAIXuf3qbv5s5JOTPdWy2PLgDQuwEC6F5
         dAnnssgasUyB/SJ5AmLrhy/NXa7RIxzGjoya17MuHvtfae/Ja4ACvSn/qFY6FHOR6YhZ
         tSiDqtJNqKRfmY3arxeXEXlICEaYrdfQMyUctMRuYe3Izq9TmPgmkQjzn+8wY6eSNYom
         ghdw==
X-Gm-Message-State: ACrzQf2xUhsFzL1nbe945C1+MOMr/xERB7gRERqXQT7KCAyJP+61xvLr
	XxVNPRl6vZzoGlr7bHx7Xfhf8mmvW7ToTA==
X-Google-Smtp-Source: AMsMyM60pj10qW+J6f9zw7z5YURjfHfsvKJYA7jB2aY50BKgCZsInqAdOVC002xdUu1tsxG9n7AJWQ==
X-Received: by 2002:a05:620a:2989:b0:6ee:11dd:4f22 with SMTP id r9-20020a05620a298900b006ee11dd4f22mr15642546qkp.693.1666390043068;
        Fri, 21 Oct 2022 15:07:23 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a454c00b006ce2c3c48ebsm10544368qkp.77.2022.10.21.15.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:07:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-bsp: remove TC0
Date: Fri, 21 Oct 2022 16:01:44 -0400
Message-Id: <166638250645.2629587.17567277183521424291.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019133952.3018499-1-ross.burton@arm.com>
References: <20221019133952.3018499-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 22:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4010

On Wed, 19 Oct 2022 14:39:50 +0100, Ross Burton wrote:
> The Total Compute 2020 BSP is obsolete and unsupported, so remove it
> from meta-arm.  The Total Compute team would like TC1 to be available in
> langdale, but removed in mickledore.

Applied, thanks!

[1/3] arm-bsp: remove TC0
      commit: 75a8c07a636314c0e5e30c01b5d595b500716adc
[2/3] arm-bsp/scp-firmware: remove TC0 patches
      commit: c9874bebc7a57cda2c419ee722184a1f5d3f81ed
[3/3] arm/fvp-tc0: remove Total Compute 2020 FVP
      commit: 75b883c363260e4873a8575607395ee4b5242e29

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

