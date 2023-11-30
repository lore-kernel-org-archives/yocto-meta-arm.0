Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CDFC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 13:44:43 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.72387.1701351881697135578
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Nov 2023 05:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LrRx8Z5L;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.174, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5d3644d3d67so4943167b3.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Nov 2023 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1701351880; x=1701956680; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVahJ9nDGiALsdwTA5IBXHwHu561UbvLjb8NMxTlhDc=;
        b=LrRx8Z5L9GVr/KKj88wjADZ0RauQA2cHqy//sg/JtlqxyHvGEdSFhKIOPGmor7r0wD
         a9RmKxoZpQ4/7vYbQ85FdaTNdHhclluRhxjWYjxTbeIK22aotT0D1MNZRfkmFRS4KO1J
         aIQi+Jd7Xy7ncMo90wHUdukLDgd7KUibFaUwypa4VqNvNBWYzwGiQo9jeQhrNhnayrFH
         irECnS63ePGZGQmCXSchTWGvXxW8zW16ILdE3COvtYt8BwZmuzGlh8cFSxxqBYoTrQJ+
         XmpTU8CLql6ncLb4yVtaM11M+nF18NgLR7RgtWQpZd/NLcaoSHXZqrNLNd9LYRqUhb8z
         +ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701351880; x=1701956680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVahJ9nDGiALsdwTA5IBXHwHu561UbvLjb8NMxTlhDc=;
        b=uRyEccmMiQqpsV1OQ4h68FG3WDxXBnSO1olO8/XSr4fasbxxsgfdhZkZy1gYE7tHRk
         zigPyaoHJi8NUaLgj58iLigNFiz1DIVwKAo69A9fV5407mQ/w0Iyzg82WydFwSOpE7tR
         LHQpUcIefV41X0in582f2DHnNwYQ/Itrsm7bDLmQnV8qODsjmD6Wsepp6Q2l3ZZCxEcx
         KLIxF9m6EVr0G97HJWyuz+V1AWJ7BJ+247GWE02Tngx2mj5WbuzDTF5IkYhqVLGgJGry
         So5mPSH5XX3YGY85cQXiZq/GzwL742ehun658egqThlTEDbJ65L5MCwRKywBjh6658WO
         ZOmQ==
X-Gm-Message-State: AOJu0Yydq9bjqlDRlM5CBd8koLJ+kR05jNNE3DPFNPkNNeF9wMOa+KQt
	h74hIMZxe02ZfLzK2CRpr5cPVF5mJ95K0It2sLE=
X-Google-Smtp-Source: AGHT+IGACVcH6ZucHlVJfAukMrfRWdRN75+RgJGsfQIkWONGIAjybAosMkaMSreOLrcursaROJiz4w==
X-Received: by 2002:a05:690c:c82:b0:5ce:1930:6db1 with SMTP id cm2-20020a05690c0c8200b005ce19306db1mr16858603ywb.22.1701351880386;
        Thu, 30 Nov 2023 05:44:40 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g4-20020a0cdf04000000b0067a53aa6df2sm504639qvl.46.2023.11.30.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:44:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH dunfell] arm/linux-arm64-ack: update branch name
Date: Thu, 30 Nov 2023 08:43:19 -0500
Message-Id: <170135179900.3686562.15897526311135913503.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231128003542.9703-1-jon.mason@arm.com>
References: <20231128003542.9703-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Nov 2023 13:44:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5285


On Mon, 27 Nov 2023 18:35:42 -0600, Jon Mason wrote:
> The "deprecated" string was added to the branch name, which was causing
> the SHA not to be found.  Update to the new name.
> 
> 

Applied, thanks!

[1/1] arm/linux-arm64-ack: update branch name
      commit: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

