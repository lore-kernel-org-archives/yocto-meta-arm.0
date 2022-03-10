Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D2FC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 23:07:34 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web09.1078.1646953652749713629
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 15:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=deyKWGhQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id p8so5723507qvg.12
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 15:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0pkEIJzNFdHah7ldntwkeHXd4/ruY8/5dqOghnlexe4=;
        b=deyKWGhQNhARv75ya8Evb9txLMvWOxdWUtZYcUHTD+1096YJSxQ447FDXVFQDw3D1u
         mL9zX08lbRhK8ZqXWnh5ugTIlWq4fWebF4yT3+iWUHOcoCGU87jcJb0g02wGxfIEi40C
         rbPZYV/pvF/5BJMfg6syM+xufZSOk40d3mjwZEGmMcgFwOVGBgb12io4NNRo6CszpT2Z
         DUevNhtMp7c18+0t7pF7fcDBv7xa+LrJbI+ty8oMqeWn8elLM4kbk9K4schvSVhcZrpK
         XId2zSOPSASJjOYQanwMloB7SY4vvL7SKcajCL5W7gObmqYpZCFeAXp+zuxP9E39cQFB
         hR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0pkEIJzNFdHah7ldntwkeHXd4/ruY8/5dqOghnlexe4=;
        b=hbsgqo+grxjYkx0ESBGAccyfGSy9tRUA2A04wvdsICkPGsYiQ08s3Upprpzluh/Z8d
         dg9ao9i9jp6paaDxC9Z4SiLxR5VQn5TkpDE5Ddpi1Mn6wgrdszU6Eo8SHDBj3JTCPjtH
         5FjXf8xgDYFDjmxWkbjE7gjVJlc8KWkJQyig8hZP+OFvHE3pkIsk7FKdASoO58XlBW04
         IF1ghGvq7bmOgypvqwRi0a07Egk3zkPUNZxNciLffpVcG+moWTqbB6dWldYNF2OqSu0i
         N3xhBfM55ER+d5eYeHXlOTM6JbfizrQnjIjvR3jgbej5d+hV9Yt2XDznGxiTFklj0HGs
         CTNg==
X-Gm-Message-State: AOAM533iIqZZRP/tZMHJ+MXHQ7POlCAMqbtv+/TaR+2jNBnVUm1qsfRV
	GwVWWYcvqj1k2AUZoatcDfw7QnMEjScYig==
X-Google-Smtp-Source: 
 ABdhPJxjpq327EgLe9LooMvXS2Aocmi/U/JF4pwnu4D5eYilr3YYaE4Bdwiv5dd3yfPZbHdxqP8YkA==
X-Received: by 2002:ad4:5ca2:0:b0:435:bd63:1e2d with SMTP id
 q2-20020ad45ca2000000b00435bd631e2dmr5842808qvh.37.1646953651753;
        Thu, 10 Mar 2022 15:07:31 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:e3e2:2786:2030:c22f])
        by smtp.gmail.com with ESMTPSA id
 y16-20020a37e310000000b00648c706dda1sm2980635qki.6.2022.03.10.15.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 15:07:31 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: migrate to linux yocto kernel 5.15
Date: Thu, 10 Mar 2022 18:07:14 -0500
Message-Id: <164695363421.73512.16676335785008665602.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220310095756.23619-1-xueliang.zhong@arm.com>
References: <20220310095756.23619-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 23:07:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3152

On Thu, 10 Mar 2022 09:57:55 +0000, xueliang.zhong@arm.com wrote:
> This patchset includes:
> - Rebased and fixed N1SDP kernel 5.4 PCIe quirk patches to apply on 5.15
> - Removed 5.10 kernel recipe for N1SDP
> - Dropped RT kernel support, as it is no longer supported on N1SDP
> 
> Xueliang Zhong (1):
>   arm-bsp/n1sdp: migrate to linux yocto kernel 5.15
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: migrate to linux yocto kernel 5.15
      commit: 3e6c53f182414fc3fc1be0af95ac9e99acda37f6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

