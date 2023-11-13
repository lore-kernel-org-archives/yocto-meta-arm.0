Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D47C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 16:00:00 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.40459.1699891197712717188
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 07:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lfhK2OrQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4219f89ee21so26885101cf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 07:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699891196; x=1700495996; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wy2Up6wyBfGVU27whPI5SFufH1PKmJGW52+o6pZ+Zg=;
        b=lfhK2OrQyefmN8pIK3vlTOOhi/sHqpu4j99K0Oj8OGVFNqfZs9f7IpphbD5N1gF4Q3
         SOOMlZcU35iCPQkM+r9XONv5J3ms43sf+Xyk26OzThWwSz0IaUyZ9e3zty11dvlMTiiY
         AZUULrVcreF/QC80RCQjRbcj5zPNEaUH62jQQCJmKHE35gNg4JGyQL9wL/NmQh02lAAq
         w5aRuFh7ueyGAtVukEktxi2wzkbEuaVfz4MDCIrBp2CmKSbQog6tNiPFO1axZsPoIJU5
         Mok2nhXbCSAN4/qTerjKOxvF4c2a0wAn8MQX/a8bs1zAhcC5GLwFiAMucn5q2T9Qxtye
         BZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891196; x=1700495996;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wy2Up6wyBfGVU27whPI5SFufH1PKmJGW52+o6pZ+Zg=;
        b=RKSKvM/x67j0+Nf9k067IQNxWci7fRyc4qMiI5bXbEwjxJV12tq2BV2PGIfhOpOgVQ
         cafFdobYW2saqbxYCEwy3jHPo0ZP0oyM+xjNRtbMEq+RyZuwmqMcdSugnEv3SlS5dPwT
         6SrxR65V2rLfepHvYteIfaI7MbyIjH5pFLRDcKG0HWkQrx8nBJzEaFMp2H3/WZb13U/W
         sf+0JP/nRXKStgqqKm802++kcLEWSwIUSQw12SLTOs6XDwHbuTbVDnlWgIT2dMgEvz8o
         PO9ZcxebII54y+xo/wSOxjn3VtILhK13+2IiEKTk0C19CKT98rYvpoHjU6P84h+FMzR2
         uzlA==
X-Gm-Message-State: AOJu0YzpsAlCEhg2sp6lbxjkH3yMja42dGMal5zcJ3UG+hlMaQA4MaSZ
	ZcYOxhWyq2SeIkYTeDBGhjdmoa+65WS7t99cgx4=
X-Google-Smtp-Source: AGHT+IHRkesIjvFtzJXLIaji/XmviY/gg1hc3H+U6TO4nyljKBG9WL+n6qxnE42b83rd93uc5nuYLg==
X-Received: by 2002:ac8:7f46:0:b0:421:b2a2:ff1e with SMTP id g6-20020ac87f46000000b00421b2a2ff1emr7985690qtk.0.1699891196039;
        Mon, 13 Nov 2023 07:59:56 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id o9-20020ac872c9000000b00419b094537esm2038475qtp.59.2023.11.13.07.59.55
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 07:59:55 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 13 Nov 2023 10:59:50 -0500
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm nanbield release
Message-ID: <ZVJH9gjp1lwU9g4C@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 16:00:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5236

meta-arm has released the nanbield support branch.  The branch was 
forked on 13 Nov 2023 from the master branch and was tagged as "4.3".  The 
tag is GPG signed and my public key can be provided if someone wants to 
use it to verify.  Per the previous public discussion on this list, 
nanbield will only be taking bug fixes and be passively maintained
(with kirkstone being the actively supported LTS).

Per an external request, we have duplicated all existing numbers only 
tags (i.e., 4.3) with a yocto-x.y.z tag (i.e., yocto-4.3).

Thanks,
Jon

