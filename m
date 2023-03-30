Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C9FC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 02:44:45 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.45850.1680230675114002742
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 19:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=cTGebGpu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id kr22so1567848qvb.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 19:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680230674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vML4gXh04XxFg67kUyp2P8EKF2tbGDMvPEQXNh4yjaE=;
        b=cTGebGpuc+yGCPbYkuSDPPYhI309YpUfVsbYAkiXFiFpgVHfRb13ljG295NwOhLZif
         E05f2MW7QfhzHButtHIq3PZHBxF4bjfScXiz+0u8WMsnHmsQlDqsP9RFNUye+JBqXVUD
         hEb7E4B8uecCmvV8jfWBR3ElOosd78eqihOrHqWWQWFJHWNWIvuDj2CN69EVE0TpUTSa
         wesun8NzkJqaUgWYV8A7AUT3dGI0E9uYsMbPAPNtPe7CnLQkiBZLAjfhIo4+k4dzZA6D
         X80P+Vu7b8eb+Xf+YWs4Uu6fe3hmCjTf8L+tNhWZPhEFipvZpKbjIfv/1Oe340s3LDuT
         e46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680230674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vML4gXh04XxFg67kUyp2P8EKF2tbGDMvPEQXNh4yjaE=;
        b=YOfyjhLMb0ZReBtLzpC0Sstmk2p5MK9swWtwpuQHweKepsQ4hqbXT221ZAPcAEKjJ3
         KBzbcOfTV3xVfPZognt6zkrSoKE3i1th/LHAhzbX3918mEqFfsf1i/uIJ0dZ1sKryl0y
         eTOdZIwT9hYNxYoJ771R0uEQCBl72Iz3VTI1VjLk7YtnVssQNsnRjIl8Tie7dtcdxJRJ
         QwvNGJB2gQGcApSEoLmqWfwejP41Wi9wjxdTj+457Z+lfIbi6gSBUp2mQugijeZ0WPFs
         kei5LFEIgQud1VQvsplCIP//EqUc3X5SkbOjYYEW3yLF2qiFbiiyDbnnRilXxeSCtB3v
         d7LQ==
X-Gm-Message-State: AAQBX9dzUMF+vC7mpxU/IPFC1Va7fBcnKknGq5tnXa5WdlO2km9ZMkaX
	PuORxSsfHlHPFHBo12ZiUxGbakVDV/0Bqspv61Y=
X-Google-Smtp-Source: AKy350Y/61C+VZ/JefSSJDdisrISQQvqWwgdIJGo1TsCpzEeMyvTrELWjqJlCc1W2cpiXYTML6lQmw==
X-Received: by 2002:ad4:5ae3:0:b0:5cd:f9fd:f66d with SMTP id c3-20020ad45ae3000000b005cdf9fdf66dmr47621875qvh.18.1680230673787;
        Thu, 30 Mar 2023 19:44:33 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id a18-20020a0ce912000000b005dd8b9345dfsm269854qvo.119.2023.03.30.19.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 19:44:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/6] arm-bsp/linux-yocto: Update N1SDP PCI quirk patch
Date: Thu, 30 Mar 2023 19:17:13 -0400
Message-Id: <168021823621.3450077.9039812907782830648.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230330163815.3677638-1-ross.burton@arm.com>
References: <20230330163815.3677638-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 02:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4518

On Thu, 30 Mar 2023 17:38:10 +0100, Ross Burton wrote:
> Poky commit 9ef8cbcdfc85c3ce2ca52d8bee2ab6929f589383 updates
> the kernel to 6.1.20 which breaks the PCI quirk patch for the N1SDP.
> 
> This change fixes it.

Applied, thanks!

[1/6] arm-bsp/linux-yocto: Update N1SDP PCI quirk patch
      commit: 1caacf78c7405a1ad3d97659c39eba247e082bc5
[2/6] arm/scp-firmware: fix up whitespace
      (no commit info)
[3/6] arm/scp-firmware: enable verbose builds
      (no commit info)
[4/6] arm/scp-firmware: remove textrel from INSANE_SKIP
      (no commit info)
[5/6] arm/scp-firmware: improve debug packaging
      (no commit info)
[6/6] CI: mask poky's llvm if we're using clang
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

