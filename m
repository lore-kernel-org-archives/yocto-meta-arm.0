Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E77C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 12:59:49 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.48672.1684328381636129733
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 May 2023 05:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=W36C18FJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7577ef2fa31so666505385a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684328380; x=1686920380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9v4jw3bX03mna1+XzQk/m7sAdiumurAnN01Yk8P9n4=;
        b=W36C18FJzVS1GOUtW8rEwij4w7fs8ke3G51OxkIBYd1UR9XP00hJg7rgFC0QteCgBh
         gUS0cvWGiG9geszWQqiXxwOM5cHH9obwpjc32r8yPEu9QFTZl2AS4rVxLVkihJnVXdwr
         2BVDKpSzTw22gEmwRuqTt5XanUbFpJlSvefwWpYg11R9RR1u8mkGXtfBiobLp5ags8Bf
         +amZhXBM1zBqe8HVyFf9TmMOsa6SFQAERTtX6GeOvsHZ9y5DDSz+IKem92OyT7jEgevI
         fPVc3AtynNvywEhHHTx0UCSSQL2Q5CuFRwi+cjAZ/5GigQChFWsvd8y0wl4OxzbPqILn
         lPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684328380; x=1686920380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9v4jw3bX03mna1+XzQk/m7sAdiumurAnN01Yk8P9n4=;
        b=FdRMPnR9kRqri8mf1Zc6VCMrM7W4M5w4/Kw1auyFrn6bUrl9L2fgp/tv0uJOcvkQOa
         j0G/xPGrAZDV/WwIKpxNsxoHePRhXwZw5GKnhN1nwf6CgWPzRt6eqzAaSfd30iRnYBVn
         IMDmk1IWxlSpXfqnSceJHFwbHJnUVIqUAAIau4VZ9CXrcOYkmCCkhX/bOVj3nUaxZ6/q
         926KX8ZxRKwplkuTt6dG8YPnPlKa1jedEtVggnsf1sN/47rOjOKvVwsLIIG0oC6+Qf0v
         Hkdex2x1QKDJIge/22SzADV7NA+DcA3cr45XB4I/0jKOBr7Q2l4+76OAxhooUKT/A6iH
         uitg==
X-Gm-Message-State: AC+VfDwMo8tpJ1ISg95svofkMB/vLOZRiBaH25z8o3DyFwXhsKitqEyp
	tsuet2rWi+leoEpJbazze2zhSgMIygRfU+F6osg=
X-Google-Smtp-Source: ACHHUZ4bcMCkKHwjpyZwJZRjG/9WA52xF858jYNRS4PvF9Dt9Pzdg+LcG+8DLJN2zI+BB9roYZ4q1g==
X-Received: by 2002:ac8:7d54:0:b0:3f1:a6d:d99c with SMTP id h20-20020ac87d54000000b003f10a6dd99cmr3203403qtb.34.1684328380238;
        Wed, 17 May 2023 05:59:40 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f30-20020ac86ede000000b003ef59e2b9a6sm1181998qtv.78.2023.05.17.05.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 05:59:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH mickledore] kas: corstone1000: set branches to mickledore
Date: Wed, 17 May 2023 08:59:34 -0400
Message-Id: <168432837401.3904838.11257598942366831500.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516161338.984470-1-abdellatif.elkhlifi@arm.com>
References: <20230516161338.984470-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 12:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4664

On Tue, 16 May 2023 17:13:38 +0100, abdellatif.elkhlifi@arm.com wrote:
> point poky/meta-openembedded to mickledore

Applied, thanks!

[1/1] kas: corstone1000: set branches to mickledore
      commit: 68509775774d9cf304e2b422927f2a9636525155

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

