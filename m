Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35CBC4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:30:47 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.9826.1666359042512823288
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 06:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=MgOBCqpz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id x15so1821024qvp.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oSRDQHR4temNEQStXxg52zcDz+soSrcigh7iX4CpSU=;
        b=MgOBCqpzs2uU6DxZWHRzI4pOwB7BR+D7OrkPyGLwxnSkwZZyOKH1P8zJ1b0mYXH+NB
         j4GOYQCcGZEi2rZ352wI8K29wUAB4TLGAkVrnnzUMbRNdC/Q27+DBHJZRJ+7CdN9bS7R
         hKAKRisp/o/z/DfwJ5YKyVdo1bXxvpY8F4VxD0xHCDHM9fptDW51CvK9VHPvtq+rmH+U
         kfvk9dHfb0uciHalF7mbHYLpi4uW0ccXxdbeNgV5Ts/pa/RPb4pyqK6cVC1VpJ/WmtjD
         T8XWKFeJhcL4HW/0LzM8BENX0G/ba+illkHQWl64NQMkasDL1Rm6hV9NcwwNAMqw7paQ
         O62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oSRDQHR4temNEQStXxg52zcDz+soSrcigh7iX4CpSU=;
        b=aPK+1VNMLoI+8a8QliDTt8ZigkQJgzAdKnZyYu73crycdcFuNbt/rx31KjieArON+T
         CHdmt4yQf7X/ahlIU9ziaMfV8oEB/dy3OQleYXOAjyVfijYi1e4rvCFP9btDPD4i0fkS
         wbrraEzgHaMo8VRwYIRLVWCMSHa5tAiGeGpBJQTcCv/ZtAZSZzVBXoJ+7LAxSZA+Oj8d
         2+kmMTcJwK7tWvCWCI01AlgJQ29ky2jCOxdlIJKpnE7d82eAO/utJNN4lagCiKGRjj5i
         zXOUTWD7Sr03vkGBNXGdzFb5pPibkI3hnSicBYaCxgCTwszUXSdM0oCiARse9m4ci29f
         jNGQ==
X-Gm-Message-State: ACrzQf2/eeg7B/+fBZvxPWSiMMXbAwxS4bzoImPb8H2+wPoP/qv4aRJT
	KKCJl8V8TsEUCOUjcj3yfOq1WZ0v+oMK9A==
X-Google-Smtp-Source: AMsMyM7XEMg7PAsk+ZLTpeVVetjYPTrmgpzGc8EMP35NVpm0w+I8jqiLFceemmLpI6HLfWQ5rSxQLg==
X-Received: by 2002:a05:6214:242d:b0:4b1:862f:49e0 with SMTP id gy13-20020a056214242d00b004b1862f49e0mr16987927qvb.65.1666359041100;
        Fri, 21 Oct 2022 06:30:41 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id he7-20020a05622a600700b003972790deb9sm7982077qtb.84.2022.10.21.06.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:30:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-bsp: remove TC0
Date: Thu, 20 Oct 2022 16:24:54 -0400
Message-Id: <166629749412.441713.6311741789431118240.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019133952.3018499-1-ross.burton@arm.com>
References: <20221019133952.3018499-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 13:30:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3993

On Wed, 19 Oct 2022 14:39:50 +0100, Ross Burton wrote:
> The Total Compute 2020 BSP is obsolete and unsupported, so remove it
> from meta-arm.  The Total Compute team would like TC1 to be available in
> langdale, but removed in mickledore.

Applied, thanks!

[1/3] arm-bsp: remove TC0
      commit: 75a8c07a636314c0e5e30c01b5d595b500716adc
[2/3] arm-bsp/scp-firmware: remove TC0 patches
      commit: c9874bebc7a57cda2c419ee722184a1f5d3f81ed
[3/3] arm/fvp-tc0: remove Total Compute 2020 FVP
      commit: 75b883c363260e4873a8575607395ee4b5242e29

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

