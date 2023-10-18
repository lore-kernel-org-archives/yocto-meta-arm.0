Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CF1CDB474
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 00:46:42 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.271554.1697589996509584278
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 17:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Sreydwuv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-66d17fd450aso48927696d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 17:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697589995; x=1698194795; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axocp/qY05v3YWP2LndK90JPbiEP0nK4D5p304rh7Ro=;
        b=SreydwuvsYmIY8Qbf14jseTG66+vtia7yLVb3KG+u3dtueXiIEx+YYES3W0v8oeBry
         RREXqn8SmAMMAZF0ah9A0VXVo7wBZXic6H35KFQ+eIma3QCmblTCdp9D+9NRFF1JjTEW
         h1sd8meQtNb74NilH7HH0onT5N9jTwfX/GseQkgkCPzpRID14OAac4zmFxA9W0XgncHT
         IHx49c3aOoE4ftJkE8ERMlyzoxTn3/od/Wz3y6Nc0sNSdAnMQy8PppyU04txBjWzah2j
         J48BbPDxwkk3ubxetqV+XnU/odiz6sdBgZiZrzlAzMJ11hgWi07r4VUn8JiNlw/CZJx5
         27TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697589995; x=1698194795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axocp/qY05v3YWP2LndK90JPbiEP0nK4D5p304rh7Ro=;
        b=aV0TSutj4PnHvq3cvPFJ0+7Rn9/nSV3h6pYOdaoRJjlItuJPAWsSguokWDzMV0UAjb
         Nj0zS7IVtIFCf9q/6tbP4OWfhuu6X55S/pTO6h5B8S8Zv9GP8h5Ta5ExKgBVocmYb1gC
         EodmZArhJReOQ2qQl1k8nQYKvOaL3vxrrHt2PsUvj6VPWaFO+U84QopXrm06wTQzfIlI
         TAwFDFpMbKowoGbe0r3m1aUNE74xOW/CN68V6W+HiJGhNVgj+knctugiLF0ouSKDp3ik
         k1WwoUEyWP9hrujlkPkCe7Kh8MRGXPKZxgZ4LxcQZY6fJqGbd0Ci+MIu5XzzKXv4AuZR
         tTiQ==
X-Gm-Message-State: AOJu0YxPm+KJbeUgiqGngN6m1xYohZR8dBSFqkIo0MdtKgA4H7wrcsaG
	ce2V4ABLpuH+O2RBGAn3WxvSL4+T72/lCLG6Phk=
X-Google-Smtp-Source: AGHT+IHn5I/FCRtl2nafcYwoMQogXSMZ/10P4bSPQzVfY6cY0RB0Nn/yjRVEElboo3reYrAXYJg3kA==
X-Received: by 2002:a05:6214:4c0b:b0:656:500e:7b64 with SMTP id qh11-20020a0562144c0b00b00656500e7b64mr4502356qvb.16.1697589995052;
        Tue, 17 Oct 2023 17:46:35 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r13-20020a0ccc0d000000b0063d5d173a51sm973795qvk.50.2023.10.17.17.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 17:46:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/linux-yocto: remove PHYS_VIRT config frag
Date: Tue, 17 Oct 2023 20:45:41 -0400
Message-Id: <169758994327.395951.1699627900503959587.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231017132548.3907869-1-jon.mason@arm.com>
References: <20231017132548.3907869-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 00:46:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5138


On Tue, 17 Oct 2023 08:25:48 -0500, Jon Mason wrote:
> The PHYS_VIRT config fragment is no longer needed for qemuarm
> 
> 

Applied, thanks!

[1/1] arm/linux-yocto: remove PHYS_VIRT config frag
      commit: b4c5577317527136cda950a55ee0b6311c21ab91

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

