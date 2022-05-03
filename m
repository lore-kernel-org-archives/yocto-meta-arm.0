Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2D0C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 18:26:50 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.611.1651602404976541962
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 11:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=3W2fqARo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id k2so7735178qtp.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=U2mCtr+xjAH8lIIDZ0xqOnQU3o2NQ76wcPM6XlOM0EQ=;
        b=3W2fqARofbPHjmtmwY09u8ePNyOkweNws728AJHb4SzaWPk1TVArvvUJXsHxcY3Ii8
         MXDEPCcqJ3NyFFHaMTYNLpPz6YYdU+6DqxZoVYb0nPm3M5U4EpJoXC9zY/t5kmMAXFiJ
         38c02XrVpRbR5zmAKdbd2AHcunIZRHNjC8hF6jBcIvlp1lcZl1k7871lybfSM6UxZadR
         RPoKXTELfpMdIe7CWrUJwVeRns+XcyjGM9eYFndUv0BmtMcm9VmuceHsDPwMJiYSwkPx
         YbakO9VGIWr+04hV94tMs04oJjnBeBiySwmnrASbnwGRWlbrultEBk5kbrEfN+WiV14Q
         bHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=U2mCtr+xjAH8lIIDZ0xqOnQU3o2NQ76wcPM6XlOM0EQ=;
        b=c68e7LfpcdPXOFHTNVLWVaVAXlDpWuFWL34h9ipmAPBrNi72EwO6XSxYhflmNxc6iN
         BNNv5rK/WpTEScZBrwN4aUojYRLQvv01coiULwgbTPa55XvnLtTL3JfVM2lIBqPF2k29
         2YKn/e9zQW0RIgdiiZh8AqmEinbJmQisGtO+x1ZaN9GCpcTlICj5Bm2rAe/GbOK7u4f/
         77PZK61UeBac1VG22GSOmHjRavgiU8KG+lgumKENululmqJQ6bVrJY9CGhh4FmfTbvWL
         SjYrzaKX+76/pLQYTWeyAanusct5pUeupNhZorILeiO4dh8cBXewM/RM2gBscZpiFEop
         YF9Q==
X-Gm-Message-State: AOAM530v81OBRPFbqq1UFwMc3LvxJKLYiO+5EWmzdNhxz0CSZNbS3TDe
	n5PcEBo9CP1qoqjTS0jdfbz3CwXoQCnt9flF
X-Google-Smtp-Source: 
 ABdhPJy1c7N1KW0aOPUXV0orFhF3BMFYBhHhuYgJ065BUks4R/XbJ4WM3iKw7ANjbBJoxvLdtlmFzA==
X-Received: by 2002:ac8:7d4b:0:b0:2f3:9f4e:938e with SMTP id
 h11-20020ac87d4b000000b002f39f4e938emr13567637qtb.211.1651602403662;
        Tue, 03 May 2022 11:26:43 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 u18-20020a05620a121200b0069fc13ce1e2sm6260101qkj.19.2022.05.03.11.26.43
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 11:26:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Tue, 3 May 2022 14:26:42 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm dunfell update
Message-ID: <YnFz4tTKUbHQ7SY2@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 18:26:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3345

meta-arm has released an updated dunfell support tag, 3.1.4.  The tag	
contains 6 patches from between 28 Jan 2022 and 08 Apr 2022.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.1.4) with a "yocto-x.y.z" tag (i.e., yocto-3.1.4).

Thanks,
Jon

