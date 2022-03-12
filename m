Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8A5C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:55:26 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.456.1647046525061551796
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=47tVuOeY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id 10so6270705qtz.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mSl7JzFI6X5S3VYHUcS4sN+ihyAVGa1WzPqAb47rGws=;
        b=47tVuOeYuVojPg0xz6nI51pWW3NWbXnW2cgSCY7fnvKnZqHy7Tcxn44b75NkB1woXw
         0TPRDoGGwAQCS6KXNvkzHjuxnA2GfgiYgJHn/QCsMlCvGeX2k5QoLaSTwcx8fpeabtxJ
         +P6cwF9xbfePpBf0+fNdHRGRrfhG/YqFyCLv3tcYQFVcEjcQzSPePrP8O8ubAzBpZTBp
         R27pDMTSCGcbZCtZH/QQWy5Qjvi5XTtg4j65LMh0FvP+S8V0I4wWPoJJ4GHZlVSBz+Rw
         AZxLzDLV3AGZTg06dSahLqMUUOBZh75CYxj59wpwISHFYoFLx4zVwSaRQXCB6I0I9FFY
         2j4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mSl7JzFI6X5S3VYHUcS4sN+ihyAVGa1WzPqAb47rGws=;
        b=Aq8r1NLGG4A7QtFV2fGS2RA6/w5DtNG3G1u9TndYopuCSUNMLIIg5Kme+kQ7hYDrZw
         7ss+ArceKewHEYn4boIkqU0rnS9lbs4Nel9f7q68e01Bny048qZUlq2vVE60K+i30YfY
         QjsLTkIMawZg7fN4qtD29bxrHmFA91XZ+sZ+zXqNWSPeWqBSQASZ6GRCHC3cKgUSFC2e
         J1HqtIPh+HEaTLXtsbSnoruhSNnlHB++m8rgh9GKR00QpDcDry1eVwpbX77Xjz4ZvE6H
         UMfxahSS5tjQlBjxqRbThwsEjmBFAwmi4vx9JSQ7Rj0q1R7LQ0jbJ9I5vRd1bRcgXUh0
         /Cqw==
X-Gm-Message-State: AOAM531UT9iwAZlKqn2XGZSgEaIAYZelmlxu1braaISBXyN5MVvC7ERp
	u60JnkusPVxjpHatJcYnUrhPg11s5VgjQKeO
X-Google-Smtp-Source: 
 ABdhPJy1RhpUs+/RMZ14yRRHEgEi37G8q0a3CnduBMwRuaQ/bs1g8IesY7OR6NO9at5MxgSPaRFtJw==
X-Received: by 2002:a05:622a:290:b0:2e1:ba01:2f66 with SMTP id
 z16-20020a05622a029000b002e1ba012f66mr5319314qtw.497.1647046524122;
        Fri, 11 Mar 2022 16:55:24 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:77d1:5990:d885:810c])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a05620a056600b00663a2c20704sm4566027qkp.132.2022.03.11.16.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 16:55:23 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH honister] arm-bsp/docs,kas: Add SSH server to
 fvp-baser-aemv8r64 image
Date: Fri, 11 Mar 2022 19:55:17 -0500
Message-Id: <164704651691.3865398.4778832318594746468.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220311125409.2027175-1-peter.hoyes@arm.com>
References: <20220311125409.2027175-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 12 Mar 2022 00:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3164

On Fri, 11 Mar 2022 12:54:09 +0000, Peter Hoyes wrote:
> To make it easier for users to test and evaluate the FVP, including
> testing inbound network connections, enable the openssh SSH server by
> default and map to port 8022 on the host.
> 
> Update fvp-baser-aemv8r64 documentation accordingly in new "Networking"
> section.

Applied, thanks!

[1/1] arm-bsp/docs,kas: Add SSH server to fvp-baser-aemv8r64 image
      commit: 90facd19a6c937244943d8c2da22b08d9e90a5d6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

