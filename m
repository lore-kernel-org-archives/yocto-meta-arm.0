Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF3EC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 23:07:23 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.1134.1646953641988186403
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 15:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=6D7k0Fz+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id a1so5977075qta.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 15:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6g6F0cN7r9gqrjdxsRFJySY3c6h8q+Oj20kEpPlPM20=;
        b=6D7k0Fz+9Gd9Xg7CMFlckSYH7VrrRNHcZCTWjY1607qAA8L8T1CRRgqpqH+2+4S3Tf
         3TZ5HwZZ5sVugzYRW37LG6ceULzqcKuS6Or7pHGFsXt9rk4dpxDBW7Q+iJuneE85XR9O
         ttLtodO/sPXyexo/RnscZmoUnwyTq7lfBMj0SxYLIoSAbr4X37yGsH7g1sdigsVx2Ln9
         YG0lv7mDDkjtOQTObJ4ZpcVwSHAXCsnNgN90xxbofEWhcZBfO6dyd5S6pdw9JoVbk5Eo
         t3nLNt4U5TehYW0sL0v6qMH5AefXCOwb4LeLEgkBZu3qUIAMlTRHAvBpxua/Ql4r9l+v
         4TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6g6F0cN7r9gqrjdxsRFJySY3c6h8q+Oj20kEpPlPM20=;
        b=4glAzZUDC/G9tH/rxWy0SG84Ue065zZjLDbPu/V1Q1VqebhauhnjxtoMGs0+EZsF/S
         0IEe13Iz7GBH4bNxfipy7a0077N/WL97VFXDBfgm/SObF8nwPg/rVy/sMD3Z7WEkIEMa
         ObdKC06+IMxlEhdwOu0zoP/t6OQwF9bxzY2iKfNvUbJS+MsilgnAtHsVWSSD9xDrjQbz
         c6R/+FQ3bdmmeExp1RIxF4HYMNcr6uVLiPsMAz0ozn1OPcoO8o4FSdfNFFHUvUGCb0Y3
         OGbF2tCbAetsuyHi78FK7r0LuGyP7PT8z6E3F68/O4GHdOAKPlBt5CJwJxyjco6XkczK
         oFJA==
X-Gm-Message-State: AOAM530hbPZj49RHT9bjPY0EZ2mBlGz0qm+NnhLoUXtDmNkIbk3er/fU
	jZK/AqnxHWqf+Geckm4l6eSflwaW0jHL9g==
X-Google-Smtp-Source: 
 ABdhPJyC03vdbchbLUVlpM7LKr1VvpFb5lZRepFrXG4kTtgChe7yCVyEGyfPLPW5yKRIkTzzWykvsQ==
X-Received: by 2002:a05:622a:507:b0:2e0:dfa2:7d8f with SMTP id
 l7-20020a05622a050700b002e0dfa27d8fmr6094962qtx.606.1646953640970;
        Thu, 10 Mar 2022 15:07:20 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:e3e2:2786:2030:c22f])
        by smtp.gmail.com with ESMTPSA id
 bm21-20020a05620a199500b0067d5e6c7bd8sm1178267qkb.56.2022.03.10.15.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 15:07:20 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] Revert "CI: use kas:latest,
 needed for the latest bitbake"
Date: Thu, 10 Mar 2022 18:07:13 -0500
Message-Id: <164695363422.73512.3946085500388147020.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220310133605.7883-1-jon.mason@arm.com>
References: <20220310133605.7883-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 23:07:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3151

On Thu, 10 Mar 2022 08:36:05 -0500, Jon Mason wrote:
> This reverts commit a2b945c75ebb671403d61ecbee08efbfc92ae845.

Applied, thanks!

[1/1] Revert "CI: use kas:latest, needed for the latest bitbake"
      commit: 2d9f342d862adf41ca8d52fd6c67951bfc4fd3b3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

