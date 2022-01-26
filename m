Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970C1C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 20:15:30 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.18854.1643228129156862082
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 12:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=2uHtG8bE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f182.google.com with SMTP id z7so691025ilb.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uwgTKCpRcpJypkDhicbWoUNFc4kXDZPIK/gCrznSMUc=;
        b=2uHtG8bEN4ok2d+EQcCgslAGgZYl1J5bojjAcgdrcO5s9d3l/+EX08G3i6c5a7W8AO
         8+q4qOjSXwg/I5MbPbOzptmMebFLjJzA3Ci6XqZZYd3ZLbUpgIp5by6hS4OBrgCEhpkc
         JrJtWpe6PQ5Kh+1sv6H26Gcm9p/CVEyVZF6ugXeZfpYjExz8fFqqx8PBQtBdXTRR+alM
         n2chld/4O6VsDBbY/DWE26U7vrTHqBhSMDvO7ONgEoqGNKyLAVE7Gf5RvfSisrK9Eltk
         qvvP98wo14uGw1aUBH1PhryUnzHIL0rDi7ZLM+Zq3VIndRyE5GgT/NixuB4cu3eSAa8B
         XYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uwgTKCpRcpJypkDhicbWoUNFc4kXDZPIK/gCrznSMUc=;
        b=dN65gBDY2NNMGPGBklYWZiYF7yjp+FAGkn3IUUorZefkrxbpfP7VyZeqqces1a5F5l
         cWShMuFbllGn2PcYFvsJVT1rxTgcrW2T4mLiKb0ygFkJFDjxFbqUkIUvyzy9WKBdvo5s
         aH/Bk7VtJsjKzzVP3tk/YA4r/rjYdMIKTop7D0YyVKWaIAV+dSPG/Xq7VqRYnvONgAHQ
         0gH4AiEDQobKR5s2zo3tDg3ZgR+EjRoULDkumi3FGao0/e5uxSDJfdtiATo8nrjDQ2zR
         1YYFZ4DvsBQISivngOXeBCty2XhI5cjgFB2jom3bIzPoQJQQVY2VgAAZd9hUKaVAialL
         /scg==
X-Gm-Message-State: AOAM533K5xbxCeIw9RwxtiQlQjl79fDSBeDnehFXDWkUSrM5mtuTwMqo
	UQWOeXSJZuNLBIG1AXpbQrLlaQeHdQoooA==
X-Google-Smtp-Source: 
 ABdhPJxdKHnfIgqW8cmVazlK3vmHopJbm+ZJTtv1bp9w3QLt7Wi3AKJGd2OZIZoxmr7K+vwePvrzuQ==
X-Received: by 2002:a05:6e02:1785:: with SMTP id
 y5mr541369ilu.85.1643228128346;
        Wed, 26 Jan 2022 12:15:28 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:9244:8ad:d394:680e])
        by smtp.gmail.com with ESMTPSA id
 y3sm11075554iov.29.2022.01.26.12.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 12:15:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] scripts/machine-summary: improve layer_path
Date: Wed, 26 Jan 2022 14:47:15 -0500
Message-Id: <164322643490.228997.5110613209115465274.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220126152539.1551870-1-ross.burton@arm.com>
References: <20220126152539.1551870-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 20:15:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2918

On Wed, 26 Jan 2022 15:25:38 +0000, Ross Burton wrote:
> As this can get called lots but the data doesn't change, cache
> the responses.  Also return a pathlib.Path, as this is 2022.

Applied, thanks!

[1/2] scripts/machine-summary: improve layer_path
      commit: b1e4cff75df54ab6d49c3b1a67e4fef806de571d
[2/2] scripts/machine-summary: link patches to cgit
      commit: 57f03491be7838279999a537384e0c9987e052d7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

