Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E696C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 15:56:40 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.40351.1699890997299732201
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 07:56:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=kOka4qUe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.178, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-da819902678so4661229276.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 07:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699890996; x=1700495796; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVON2B6IHgH3VDLCnYMgpj0FX7bbQNNVYsGKdJ6VB4o=;
        b=kOka4qUeA1iOr1CZXIYgPVaolIIMn7UXdi3QBuyLNC2nGHM13CABpDI9UKdgIB5gPK
         d5loWR4EH3IfOS3XjzZXgOjedYg4+dpaGNuvb2xswUjtEKb7A/zWYc29q3ZGtIVdKKoV
         gyYbuCkH9SDhM9EiyveYPJEfs+MoARWF1aMUtIiK2vK5jhZrJd+IzuYTzQvEqStYqUj7
         3d/Kf9Aqpl7oO31Z+n0jkHPuhAyZY2/btMPy8tdfdCBaZcXriwDLrLGDOphp0B7tTkUl
         lQvcYf+AaFWuqCQkrKntfvThHHAUDyPIx5v5HFfsmzgCQwXdN9hwWech80qMgSjWIHmE
         bjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699890996; x=1700495796;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVON2B6IHgH3VDLCnYMgpj0FX7bbQNNVYsGKdJ6VB4o=;
        b=g7JP7vykmw/NHTt2kpeWox/vAK413URBxL0rR7b0R/liF8JZIe+02JeFO16QA7IwZI
         xRb5dVqiEF1qpOn+KvkGi3lq5EWBa3n/tPr53k+MiZ1smkyb3AGmenHPh/hvOK0QpV6s
         R8AmxWSND/tKy2drQG+iptQUTzm2PGtPIzN4ytTPL3ZRVVKirG9MDOXPRLaID2PTAUe8
         A4T4Dus1X/vjwk2j0LAq36FL5V6mFAFOhjfCJ2cNGIPwrytrOsZSLgaLXoRxqmMEsx0e
         eg3ZAstjvhyXgQyfhAk7IYbpttcwMf+qs5xsQv6KIGTcjaYwTBCQIVu530s2vDstPjPC
         nTIg==
X-Gm-Message-State: AOJu0YzXvC0aUeX6kbtI9xEldeVDt4jXvh7ilZdYHTvsE010XCx7mMqa
	20ol+xQIwHcICDompABt2fuN17rMtnbV6LKeAJc=
X-Google-Smtp-Source: AGHT+IF1p2dXyiYtGWNBN5FYZbk+FLrCIic7OnWyIpyHE12ijdZ6IrvBt3T/E9WfjjlMcxwYvX6VzA==
X-Received: by 2002:a25:d210:0:b0:d7a:8e37:6d4d with SMTP id j16-20020a25d210000000b00d7a8e376d4dmr5874461ybg.43.1699890996089;
        Mon, 13 Nov 2023 07:56:36 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id c17-20020a0cd611000000b0064f4e0b2089sm2154004qvj.33.2023.11.13.07.56.35
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 07:56:35 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 13 Nov 2023 10:56:29 -0500
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm kirkstone update
Message-ID: <ZVJHLWFOjiYpaccH@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 15:56:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5233

meta-arm has released an updated kirkstone support tag, 4.0.3.  The tag 
contains 2 patches from between 10 Jul 2023 and 24 Aug 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.0.3) with a yocto-x.y.z tag (i.e., yocto-4.0.3).

Thanks,
Jon

