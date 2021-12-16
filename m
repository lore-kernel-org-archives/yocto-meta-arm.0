Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634AEC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 03:15:44 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.5490.1639624543533542643
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 19:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=w79Ae5fQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id o17so24110289qtk.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 19:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6WoBlUmzRXlmq7gNOKOaHFqoQ7DgU4zY5olkp7nXqZs=;
        b=w79Ae5fQu5HHRwl5hdRwbeW5ehb3gyW17Za3vnCxbLn2F1oJoG+fc3yJOQbImvNklM
         HQ34pMLkee1CUCoHBJk2hupcRPnt97wOg8PXjjg58et/H3r7EkbpKDsK//tDMX2RtmV1
         HyPIDdreJ5/eXAliPDQJMWz3L6slhqcTX/3pGtFan/Or+hxsjr74ffac6DcwTwCFDZtj
         WA/9Qq0jMRfQqaQKnN4pBlnSmbqcdK0dRbYUpttRW1lHWMI5w/2TeHE4XcK4DYLOHnrW
         nM7K0MDqu9zMEOqDCfV8C7ab8YleO0LJMqu/ldtMShhewikXvayFLW9kB4bBZpnmOTsg
         gvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6WoBlUmzRXlmq7gNOKOaHFqoQ7DgU4zY5olkp7nXqZs=;
        b=69Hy1G0IpFyftbTt7LHpuJoDtNYxYVXRnepsQ75wOEFYIl5dFE8G5YfWIUBGSub4Kr
         O2/aNHuxM9vAwdMuka3fO/v2ERFFkSKPE1bwggmjAizAj1EBZHp3Etgv2msSeZS9I1IX
         +VwiGRFFvIxsM6Ge+L20lI8el+FetHKZoaOwR0D1qJS/e4LXUu8EuoonUsoVR9LBilJk
         Ri5geIlNc+Ndbol5FednUQpLr7QBdgoyGU7ykjlMIBndmmOJrizcEe1/pnEH4K1FHAh4
         1a4qN2DTgXyrE5KZBzlbP7+LyYZoSq2HBoYyo5I5c/UTH4N8xpaOrTUZxXzj6fKHCFMD
         63dg==
X-Gm-Message-State: AOAM532Bn0y0R1Zhs1NSRZaEr84SaT1VF6jLLYh7S9lkhtDyhcff5h0c
	czmy0+lD88K6T9xwf77UywTvLozxw4wjYCsQ
X-Google-Smtp-Source: 
 ABdhPJz9yNp51X99STtbUhodndFoDss6j7MKGn0FB7RLlM3dJwQpBdc3OWRHUaQagMygoUyB1tIY9Q==
X-Received: by 2002:ac8:58cd:: with SMTP id
 u13mr15421505qta.426.1639624542615;
        Wed, 15 Dec 2021 19:15:42 -0800 (PST)
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 u21sm2094285qke.95.2021.12.15.19.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 19:15:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp: add zephyr for musca-s1
Date: Wed, 15 Dec 2021 22:14:55 -0500
Message-Id: <163962449530.655.7932030307259586080.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215154145.6610-1-jon.mason@arm.com>
References: <20211215154145.6610-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 03:15:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2726

On Wed, 15 Dec 2021 10:41:45 -0500, Jon Mason wrote:
> Zephyr supports musca-s1 boards.  Add support in the machine config file
> and the relevant CI entries to build it.
> 
> 

Applied, thanks!

[1/1] arm-bsp: add zephyr for musca-s1
      commit: f028dc0e8b97f4d271e29b62ef403a6a63be72cb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

