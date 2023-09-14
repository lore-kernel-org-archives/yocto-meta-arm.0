Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3367EEAA4C
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 14:35:40 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.13998.1694702135195893786
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 07:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lx5WWWsd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-65618fb71a2so5259306d6.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694702134; x=1695306934; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcQpVpsV9L3/Y5NQnkARPYlfIS+fvsAHwE1WcuGwW7Y=;
        b=lx5WWWsdfZIcV7gIGwQJHrcdOuL3BwfX9EAk9DcZ8BYTbW7EC+3azrNvDTapDFBvBc
         MgPmPgPBCQtdsKo3bPkOC/4Yh6GKnfdMPPr0HhIGVnRPD6bpo+z30XYqWQJY+1+it2g7
         htqscYAG+eVR4obL2l754fr/sw5FnpPhom0MvB8UjyDDmR6zTgIVCGvj/etI8F+X5+9c
         PqLucaDOUEUiPHVWqQKyfeEixyPlCOYpb5nYNLWmd7X16qJb8ZDVV6r3cP8aaDLjo9z0
         7gvfZQzdVymqQq1MwByPWRiWABtp2deKcIyoPDsRLSsrSGfg0ez/Ka9oOJhTlImvr7F0
         oolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702134; x=1695306934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcQpVpsV9L3/Y5NQnkARPYlfIS+fvsAHwE1WcuGwW7Y=;
        b=sU8E/ag+WdNCz4I63P76lEc7/gLsvH7buDpAWZeX0+CV/ReyOE7ff6cScnTxuAbP4H
         8CIGbZhY/TSPFyus6yR17R18H6PjqqSCJJC1DFkiw0Pwd7ef5ikMnGbOXzruqqZf9lVH
         3awXQFw2y3JWuvvsqAH3+M26MIlW7jzayEjCDAXtauIQpek7tJd6dLa2EYfbEbg/T0ZT
         uX3ciT8T6Svz1xQAdxwLFrjHwro8dvN80a1/RkMvs0x0Yxw12fMipOAPQnfyOCxDloO7
         sAzWDg+ooKOdEby2jJr5etF70/qjEgBNWulJUZCPa3jKwfM8sSediJmnKzmWNADGaD84
         317Q==
X-Gm-Message-State: AOJu0YyJwhCS8sF6yWfPtb/Y1E7kaqQAuhpgTCaEwYs+gVe/PQZavv/a
	h/uN9UKt/rpEePLDgjIK4FODQhppacb4/f6VWWY=
X-Google-Smtp-Source: AGHT+IHDsdndaJzQFR+ptCy81DCgeW3bZJgX5C73m3AD+T0qESBD3Gjo9VLfWautoH6S0HIdTLW5YA==
X-Received: by 2002:a0c:b3d6:0:b0:651:94b2:8d87 with SMTP id b22-20020a0cb3d6000000b0065194b28d87mr5805235qvf.6.1694702133778;
        Thu, 14 Sep 2023 07:35:33 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id u16-20020a0cea50000000b006562ac84138sm199005qvp.141.2023.09.14.07.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:35:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/2] CI: Allow a GitHub container registry mirror to be specified
Date: Thu, 14 Sep 2023 10:30:54 -0400
Message-Id: <169470185470.2756453.11902506453257376207.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913140342.452683-1-peter.hoyes@arm.com>
References: <20230913140342.452683-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Sep 2023 14:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5048


On Wed, 13 Sep 2023 15:03:41 +0100, Peter Hoyes wrote:
> To make the pipeline slightly more resilient to external networking
> issues, allow a local container registry mirror to be specified in the
> GitLab settings. If not specified, the upstream container registry is
> used automatically.
> 
> 

Applied, thanks!

[1/2] CI: Allow a GitHub container registry mirror to be specified
      commit: b6668069b8364f910fe6da06bfb58b96fff2c276
[2/2] CI: Make update-repos more resilient to network issues
      commit: df01b29f3f54a82886a2852dcdd9c0359ecfee81

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

