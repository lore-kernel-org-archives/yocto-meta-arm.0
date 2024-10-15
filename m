Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117A5D216A9
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 13:49:56 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.14097.1729000191150152796
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 06:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=oa9QcHJk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4603d3e456bso48328011cf.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Oct 2024 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1729000190; x=1729604990; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUdWVDwcDs4h4TVeSAw23no0Su4i9INpv1he+sISLwc=;
        b=oa9QcHJkwZTf4weEwTX1b8YE1yqiYdnPv4YDpybKO/PEmlSYu6ElTsuFyN9uuDvkcQ
         v6qs6XkLyxJHOHevwQIWmXgwwNqscL4ADL91DuOCW+g79l48Y5vIP9LYBoe+pF+6G5kC
         YDa9UkQLReQxr5la5/Hb/OE30DBGBGdRQhu7DcW/B0GxeqzxDdDdHrftLl1PfjfbKdZX
         Sc7HV+IEHK7sE3eZSe09od+mEdSvH6cabsQBYLCyxAptX+FY1UtvjA3D5fTz27NRZP1b
         nCK4TLzsle8QcttJNlzd5AuiTpr62plusGChsAWjdiSC5alk5aW0QXpO+W5t9VMQgbIG
         Nlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000190; x=1729604990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUdWVDwcDs4h4TVeSAw23no0Su4i9INpv1he+sISLwc=;
        b=OdyTbJAAr0skOG2LSo02YhKyoi9m/KnzjOCC1HhGjBGDWAcUJglZNMMgsaWSuNyCVw
         CZd7WxyaSvl9aEogPPZrS84ATqsoAHLLe1Z62j8XSlOAWoIVxd2n572d8RjLJNy14uCY
         ph2YxDr6SS7JxwdeeHTSvWZyLUF+Cn6sHo51p/kUsdUIisiLPTRI6WxIsXSkIaCCSv+u
         EL2sktz8k2Z45wVd1Igo8Oqr+ReGrB1YrEw7aOQWSgCDKXoyld8PRcEomIIYBo7418iu
         IoxheH7oKwSKbPbbDgsjUx7jhiJ/J3u4yEfl75or/tiWbEnvM2mFUVg1LDYuPk03c5V3
         wZ3Q==
X-Gm-Message-State: AOJu0YwW59F8+JFnsW7lSU3GogSPTIxwRB0TA2HHgJfLTFHGQQlrCBXH
	E78ZW+tUiQJcoKtnzHvbP0nqAx/eQyQg3drLwHGjylor24xG3sZdk29l2spRvmDE9lG87muN5/I
	=
X-Google-Smtp-Source: AGHT+IFHsw8474gPHuFdLBDskSgYME2B1uZ/wCSAav3/zUM8o8BQHcRxzzhV04LsFeoOw36J7EW0lQ==
X-Received: by 2002:a05:622a:48d:b0:458:2fb7:503a with SMTP id d75a77b69052e-4604bca6914mr231933691cf.50.1729000189643;
        Tue, 15 Oct 2024 06:49:49 -0700 (PDT)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b378b02sm6600901cf.64.2024.10.15.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:49:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/edk2: update to 202408
Date: Tue, 15 Oct 2024 09:49:39 -0400
Message-Id: <172900017888.4133599.3091546510206494718.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241014165448.46530-1-jon.mason@arm.com>
References: <20241014165448.46530-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Oct 2024 13:49:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6194


On Mon, 14 Oct 2024 12:54:47 -0400, Jon Mason wrote:
> Update edk2 to the latest stable release tag, and update edk2-platforms
> to the last SHA that seems to work.
> 
> 

Applied, thanks!

[1/2] arm/edk2: update to 202408
      commit: 603130b75a5a52f3b0ab1972d4e3bec3a4aaf411
[2/2] arm/scp-firmware: update to v2.15.0
      commit: 3b59949155054cebead9a7c1ee441c8fe53419a9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

