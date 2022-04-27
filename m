Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4D9C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:49:11 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.3964.1651103345727679611
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=li5h755A;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id jt15so2146590qvb.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CGz6xZtiDicvn8rv7SPmU00goCH/DRVLNEs7Z/TO/lA=;
        b=li5h755AXxw9GB8NgEk506x0HgUVOO/AfBREXRrjfELFCPZWa4YGHpYtamIEzWkT4W
         mnSV6Uj5vjIqM1hh+17h0Y0xhRbzT5u3LXRU+N3KTWDk7dt5g15f7qjgFICtf13V5E3Q
         aNluL3MSV5xWWwX2cqAHmQdjkkt2iRYWjwU0LhZvLPQdE1BiIIWIWyVAvloGmJLM1Zr1
         6/L74U2wD8/IobmipGDgIz/hLI46ncldfANh5Jvxk1LQi919o6rxuBon9jyx/Zh3lAAR
         ibXZOW3g+C7/VfQA1vp0fHeM94PLlFtD6LDRutUTfwxlBkARPmOVpmW0AgqEhUTJpeRA
         e8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CGz6xZtiDicvn8rv7SPmU00goCH/DRVLNEs7Z/TO/lA=;
        b=vO9tob/xsvaRFcYrwNd2JXA8fPRiAAZp9GVCIPa4jUHNb8TYZp3Mm5HwDI5j+PoQKd
         f8TIlk+XrB8HNx2wvtKE0DEwhNKinUweicfCQ+sdTbV23ctzvNgXzORhyV4UaSmc3y8t
         tN4vfNtXP6sA8R4Wf88oWhrogjtrqVsjlk0Mt9WwdwN8q3ReZuvc4Dn/OS4HYwvfhgb6
         UDW9nZkWmI3iHTYD+S9FMsifyhV7Ulf84XLf0Z2GF3nN5olUseaHHQoq9UI2J/n7vJYE
         dH7vH6TXNgoRprQ0qEos3AQyktpgSmq6D275hpTiwRefCn3qzZgPLvSY/RYZdQwcS3IZ
         Bq8Q==
X-Gm-Message-State: AOAM530t31HZllvm+yGAq25ED41j14d8QxGme4TtE0nAHfw76So2PjAa
	jSOYJfEz0VRl8bv++fy3do9XJtWjsgFjZg==
X-Google-Smtp-Source: 
 ABdhPJzHJpNIW+zRBGRJOiNpVB3sr02aCcxO3BuaYSArokwagndFxHfMR+sBOrrkQl4rwfOoH4oqKA==
X-Received: by 2002:a05:6214:202f:b0:432:4810:1b34 with SMTP id
 15-20020a056214202f00b0043248101b34mr22120988qvf.35.1651103344684;
        Wed, 27 Apr 2022 16:49:04 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 d65-20020a37b444000000b0069e9f79795fsm8667933qkf.67.2022.04.27.16.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:49:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH v2] CI: use kirkstone branch, not master
Date: Wed, 27 Apr 2022 19:48:39 -0400
Message-Id: <165110331935.2615227.14802622653997137959.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427203120.2116813-1-ross.burton@arm.com>
References: <20220427203120.2116813-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 23:49:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3321

On Wed, 27 Apr 2022 21:31:20 +0100, Ross Burton wrote:
> Until we have released and branched meta-arm we're tracking kirkstone, not
> master.  oe-core has branched and master is changing fast, so switch
> the default branch now.

Applied, thanks!

[1/1] CI: use kirkstone branch, not master
      commit: 84abf1d5937643ea9a2a684dea6fad5bcaa9c0ec

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

