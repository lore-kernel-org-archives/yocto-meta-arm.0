Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5C1C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:25:21 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.109878.1674843914766705454
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=zz5LW9e8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id v19so4743034qtq.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 10:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KC/0dzy9cwo87QlYTmcf/KIKvaa6S6kXFXW+2w2dfvk=;
        b=zz5LW9e8asiK17HNWvHly0GizPDaakjwmS8XqDBLaUmAvJjaopGO26DmpLenbDTfFm
         xK5L3w+Y1ny8AJ/QKB1DGE9mMbs/vbJ0WtZYDGPvrEDDU67Lb628OP6uQHmyqpHI+H32
         g45qJ7DjVTLghx/uxWdYfrz/tMuSONTpa9nk8FDufOhHgkOi+cGjzAHmxQ5aWAumsJlB
         akz/c1tvwDeJGQE5uZxlXk2OSes5HDTsQSSyhjy/sEvCwetFpIfsYoaedMe50CCK1zaA
         E9uRNrWjqTc87iK1i6zRu1RUx5A9HTtW3jUKkY79Cs0/CsyLEalDsPspwVZNwiGKroE7
         3N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC/0dzy9cwo87QlYTmcf/KIKvaa6S6kXFXW+2w2dfvk=;
        b=paHQTL+srhpFYzULsVAcFzdgFDtbCafolGhj3pk+HCH3AtbvXAxtzR+YafSr/dr4ff
         evUSd0QvrM6QALlOneQewGoV/7BZLgdRQVIJEQdLoz15DyUOtrDGm+hhCFRLJv1oFXXX
         LxfPQgQfCoIRNYypzEJYaznZ2aYoggeA0CH6lWzZcpeX0CKAC9CcHYM/esD8Fv6bq4nR
         5qEZrQVHfd/yC7zNli+wx12yCnevbH4jnaPPDpXXBiL5W5gkVXwyeXryZ8PDKb0ZD5B8
         I/6lTchDuxiTbf7Vw/A/sNnYZIsS+pwSfQq+fdNKdnAQbHQ86Q3YSE+4dlOqjQ3UlE06
         ejUA==
X-Gm-Message-State: AFqh2koEusdqG4HfCjB7N2jSXgiQzA5bZonwZHIGC4SBv66HgP9pyFUy
	YCuRDthmywmDINEfmhOjXe1t8H4tg2A3O+pS
X-Google-Smtp-Source: AMrXdXvruYCtvlMWm+2cRRIIU6v3vTo12KLFxGz/N35w50fVSWQg05gCWr/1IhSbL/3CZg1JRMsi/A==
X-Received: by 2002:a05:622a:4f8c:b0:3b6:2d63:c852 with SMTP id ej12-20020a05622a4f8c00b003b62d63c852mr49534615qtb.47.1674843913453;
        Fri, 27 Jan 2023 10:25:13 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id j5-20020ac86645000000b003b80809d677sm3090668qtp.47.2023.01.27.10.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:25:13 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2] arm-bsp: add u-boot v2022.10 support
Date: Fri, 27 Jan 2023 13:24:47 -0500
Message-Id: <167484388781.842866.7144191400980295608.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230127135406.11738-1-jon.mason@arm.com>
References: <20230127135406.11738-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:25:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4330

On Fri, 27 Jan 2023 08:54:06 -0500, Jon Mason wrote:
> Upstream has updated u-boot to v2023.01, but the update is causing
> problems with some machines.  Temporarily add a v2022.10 recipe until
> the issues can be resolved.

Applied, thanks!

[1/1] arm-bsp: add u-boot v2022.10 support
      commit: 23feaec9b4cb34ad1c472dd3fab72dfa1ff17d8e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

