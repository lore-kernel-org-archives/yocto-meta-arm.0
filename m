Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FA7C41513
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 04:15:07 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.6498.1720584897910965040
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 21:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DEy8aX7R;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.175, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e036105251eso5866886276.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 21:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720584896; x=1721189696; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIMebXml2jc8lF+FeX9+Zs5vSRVO5o3F7NMka2lOgn0=;
        b=DEy8aX7RZavYwNi2dqO3uxTKT822D1DlzI5EFhmltKXxQkTK8Fn4/gMTkdZSJ3OJec
         IlxFEi+iZXjEFO+Azj4D/0NBRx+2036v30mpbPBs/UiX1hH1+LzkGpp8kiELFEz/ZNMu
         XhL9XSHxLhTUmdyjtaexg5dKQ2Pgt0fSctGE1d5OVxfIWVLjEpdx8kYBs+XHtIK2787n
         XdbiXjpKelk6/LyGHKXvscWwrAUPdME94dMQAbPLKQR/cdqSawUDMKsShIMsvMUanrjS
         CGTYb0UKNGIRlhBn6KCFNHx3d7PKmIVOUV3eB6RNfzZyOzQyBmrJeAF1s3rAwLob/BAG
         yqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720584896; x=1721189696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIMebXml2jc8lF+FeX9+Zs5vSRVO5o3F7NMka2lOgn0=;
        b=qhhKdTqKl4AEKDQU699hlbWLNqb2jgj3wryM/ct/HMtz5g88UFlFW+RdxEtDBkfjVt
         zDZgUtktsduX0gqJUu+RKgK9dcp8CnBIvaBmFfSgI/sMCoSCOSLMqW9wHZRYsy5tYIH4
         7BxpDqrHaz5nBmYCe1+LeAfrrmFOdyqUKZEC5jFtzkxbhuuMx6lvXCom4iyOq8DRLVCN
         4lRESbjykty7t1ZewKvLzFwXsDCimHUyRdxNfkCGRzOZ65NvmubIqVYPG7UZ8XdQcXYq
         /2BFioyf/SmElP0jJ0gVhODE8q3poj61FGiPxEkdnS17Z0Fr4Ybu3ILLUHSFZIMonwDs
         jNkg==
X-Gm-Message-State: AOJu0YwlJmai5MjRxCooSOynk1c7IphR2oqoI9FvH7BQFOKvfYkkR8i1
	nni5AJFlF2Be+w3beqfdv/vOky30xNftudODX1XpAGw6yzF9vrI/6D5S7AxxiECvwjey9RM940c
	=
X-Google-Smtp-Source: AGHT+IHfjuAYPM4gQljsDiHegCnqmCsd4kVZXd9skbBr1Wd32CYLkETW4UqmUzKmDpKCKGr1PQFf4Q==
X-Received: by 2002:a05:6902:1205:b0:e03:62dd:faec with SMTP id 3f1490d57ef6-e041b172084mr6404385276.48.1720584896554;
        Tue, 09 Jul 2024 21:14:56 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a8f5638sm540181276.31.2024.07.09.21.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 21:14:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: remove unnecessary clang settings
Date: Wed, 10 Jul 2024 00:14:49 -0400
Message-Id: <172058488959.1547809.3830789531553020729.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240709182753.33263-1-jon.mason@arm.com>
References: <20240709182753.33263-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jul 2024 04:15:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5877


On Tue, 09 Jul 2024 14:27:53 -0400, Jon Mason wrote:
> With the resolution of meta-clang issue 766 and
> OE-Core 15d09b02b2632ab1cabc3b1bd9f521e6d3d3b83f
> many of the settings are no longer necessary to be set as part of our
> CI.  Remove them, as it is causing other issues with CI.
> 
> 

Applied, thanks!

[1/1] CI: remove unnecessary clang settings
      commit: 4cddc5f600706162870438b845a0aff94909560e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

