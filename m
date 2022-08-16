Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87397C00140
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 02:08:45 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.10875.1660615723008185744
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 19:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=DxSSvwYv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id j17so7204554qtp.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 19:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=1+jmdKOdulCqCDAcAN1otV+Mvm8CM/UiStJIU5H8PRc=;
        b=DxSSvwYvXva8gN4wuGGobb8SyrmgZNId48eMxNCd0tDOHWLdyoB6qblvtwcExnX/nu
         emDsMRFC+XQG3cxvAE0FLrpitoF59pp8dsrNntxWaN/zdp4N7mrUMH1C5XudcgRvU+N+
         iE71Y2hxyux9ojW/vnJirU64xaYpkZue19C1mz+nO0dJXU4SAGICQpw/8z5PlIoG12GE
         TTr9YgdQVw+P963BZz4l7rGqgwNT58CqiVbGn0qsHsj8xaehWrjnJF5eARX+Z1PSICRX
         XQ4R/ZtpIybq9bJM1RJJng3X9uIPsC10oLmdDEgyk8j/f0xHRW7dGG2wbltVThl4Ee/B
         gRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=1+jmdKOdulCqCDAcAN1otV+Mvm8CM/UiStJIU5H8PRc=;
        b=Uu1/p4LwvV8zYJQs9+CgduBvPKf9QMn/bppS8QgQ+lmJ8vGHXtnt8yeJN6IFcDzYQT
         a5UPCposbO6zDkqwzbjx8kRB2PfUIqWjIyaTpKKsPN4QGQN58zmI5fAXgcG2tRkztcuT
         KbyKZtP8qgQNU9ItyjU1fKCZrN+kqXLhU/y2JiR9e7smCHdpYnCSOmkiwURPN32DD0ny
         /PFXuuKnn1jjR2V+RWJRT6WU02qmJKlclN6BQeBn0XmEVjUBOupmKNVS8jmeTalaemKY
         G2bx2v4unFQbduFkkNozK3dVFFkXyn4atzYo0RgZs5kC7LM3IZvKi/HIl5Zu/cSrBEqx
         I2LQ==
X-Gm-Message-State: ACgBeo0uTpbtTly0vApRCIfs4tBAoNuBK1awlDKjEq/CFSTHr2a6ZMEt
	VehmfB+C5g40GH0ErqlLqg53YS64hqfo4cMQ
X-Google-Smtp-Source: 
 AA6agR5XW9OH/xFAA8wENw4IQbNcm5iHOTsb6JSSmd/SmGZj2+Zy9/GLaSuFw2nJ6jDGLQ5IfPwdmA==
X-Received: by 2002:a05:622a:3cb:b0:344:576d:f877 with SMTP id
 k11-20020a05622a03cb00b00344576df877mr7971780qtx.185.1660615721481;
        Mon, 15 Aug 2022 19:08:41 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 o2-20020ac86982000000b0033a5048464fsm9161099qtq.11.2022.08.15.19.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 19:08:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/fvp: use image-artifact-names as an image class
Date: Mon, 15 Aug 2022 22:08:20 -0400
Message-Id: <166061570226.998117.17796447409121239679.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220815133948.26528-1-jon.mason@arm.com>
References: <20220815133948.26528-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Aug 2022 02:08:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3690

On Mon, 15 Aug 2022 09:39:46 -0400, Jon Mason wrote:
> Per upstream commit, image-artifact-names must be used as an image
> class

Applied, thanks!

[1/3] arm/fvp: use image-artifact-names as an image class
      commit: 98c515f42ee6a6f145d95a3bd7032bbff0f62bd3
[2/3] atp/atp: drop package inherits
      commit: 8058beeec1ae5c63051bbc1828815151a09e24d9
[3/3] arm/optee: Update to 3.18
      commit: ba502ba11e60b310becb45e9abef9e1655354625

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

