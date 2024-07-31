Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A89C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 03:23:25 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.34881.1722396194096490297
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jul 2024 20:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=XlaBSOyd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6bb5a4668faso26011546d6.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 20:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1722396193; x=1723000993; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zoBfbfjE9O/sFAXbSmakbFRKo7b/ikhfha10yyKEdnU=;
        b=XlaBSOydiB6SeGa48CivPw4tfOvSMkWCmsB4EkQC0aFaZH96yaiOHVlaN8bVPDgbLe
         aidPDFvd0McANNK9Sxzonw8L+RQGty59fV8ABUrdTdRSJzM4y5HehED3lgKmqmd2Re39
         e84vVSBszjeizS0t9bp2UQLLpT8ptvZiRdlb1clX3K6f+5p9WaLDQ9LybjEXpA0rVJmv
         3ge/oY4Rp7M0S6zf+vXonvqt9lJ9lXBkoD6mZaiXuG6F8yfIRWWWi+5bWFIJUf7vklWg
         HkA+ikAxBiQi4A8uYUj8CW/gCB+WjGEX2ETNn+0ElTTFSor9xhsYWs4AgICWEBsoIw00
         LBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722396193; x=1723000993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoBfbfjE9O/sFAXbSmakbFRKo7b/ikhfha10yyKEdnU=;
        b=ivnYA1pSgrKtlW4c308+mNGYL/KoSH2tbzgbMOaPk5RlQ14oW4Wq7S/v+33FSaDgU1
         G8fswIkoMx+VyxO0lgn1tNs+17oMHGboNCGOY/2JZGc1xxIqfF35ftPz+yPW89JvzTAb
         CA7uQnNdyHCQjWalmMwIdn5xuOVWS8Fo+o+wdXHdNOwbehJpw/xnjVDSazCw0FB5avxy
         BXg/80eeOSQquy/P+4y46T/HcFLwoMIU4CD1R64C5iphkRZQp/G5PUSB7xo153A6pRON
         H0YFqvQaj8ZXP7NtJRfr9Jvpyuoc6VOwy05FaVW78xRFaVl5BHzNAWfkRVC+s7fYT5wC
         +zow==
X-Gm-Message-State: AOJu0Yz6ApKCPtxj1EQGh5K2EcxDDK0X1GIkpvFQJCMxEGSfw5tegIZC
	wDkSg6zZ5jLT9yqvnHXGY3e5CP93S9+NO9Osv0QvqnOeGHHbFCOMokDwoHuAlw==
X-Google-Smtp-Source: AGHT+IEHKqWMilAuv2X9rO8IJwE7fpF9X+it7A3MPj1+/gGyTBQAxRmxURSEHodXcs6AWeN3WBrRSA==
X-Received: by 2002:a05:6214:230b:b0:6b0:7482:313 with SMTP id 6a1803df08f44-6bb559f8ea8mr151061256d6.11.1722396192886;
        Tue, 30 Jul 2024 20:23:12 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3f8d85d7sm69484566d6.17.2024.07.30.20.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 20:23:12 -0700 (PDT)
Date: Tue, 30 Jul 2024 23:23:10 -0400
From: Jon Mason <jdmason@kudzu.us>
To: amr.mohamed@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH scarthgap 1/4] arm-systemready/linux-distros: new inc
 file for unattended installation
Message-ID: <ZqmuHo4k7jgRcnIO@kudzu.us>
References: <20240726100109.1878470-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726100109.1878470-1-amr.mohamed@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 03:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5933

On Fri, Jul 26, 2024 at 11:01:06AM +0100, amr.mohamed@arm.com wrote:
> From: Amr Mohamed <amr.mohamed@arm.com>
> 
> Add a new inc file to unpack and repack the distro ISO image after
> adding the kickstart configuration file inside.
 
This series isn't applying to scarthgap for me.  I tried:
b4 shazam -s 20240726100109.1878470-1-amr.mohamed@arm.com

But I get an error of:
Applying: arm-systemready/linux-distros: Add kickstart file for Fedora unattended
Patch failed at 0002 arm-systemready/linux-distros: Add kickstart file for Fedora unattended
...
error: patch failed: meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros.inc:2
error: meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros.inc: patch does not apply

I'm not seeing this issue with the other series.  So, I don't believe
it's related to email garbling the patch.  I'll follow-up tomorrow
with you.

Thanks,
Jon


> Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
> ---
>  ...m-systemready-linux-distros-unattended.inc | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-unattended.inc
> 
> diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-unattended.inc b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-unattended.inc
> new file mode 100644
> index 00000000..f8c9c6c5
> --- /dev/null
> +++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-unattended.inc
> @@ -0,0 +1,45 @@
> +SUMMARY = "Arm SystemReady Linux distros unattended requirements"
> +DESCRIPTION = "Arm SystemReady Linux distro unattended configurations \
> +               and ISO image modification"
> +
> +EXTRACTED_ISO_TEMP_DIR = "${WORKDIR}/extracted_iso_temp_dir"
> +NEW_ISO_TEMP_DIR = "${WORKDIR}/new_iso_temp_dir"
> +
> +# oeqa test case must be added to TEST_SUITES to acknowledge that the unattended
> +# installation was successful.
> +inherit testimage
> +
> +python () {
> +    unattended_required_vars = ['ISO_LABEL', 'BOOT_CATALOG', 'BOOT_IMAGE', 'EFI_IMAGE']
> +
> +    for var in unattended_required_vars:
> +        if not d.getVar(var):
> +            raise bb.parse.SkipRecipe(f'{var} variable is not set')
> +}
> +
> +unpackiso() {
> +    # Unpack the ISO image
> +    bsdtar -xf ${WORKDIR}/${ISO_IMAGE_NAME}.iso -C ${EXTRACTED_ISO_TEMP_DIR}
> +    chmod -R u+rw ${EXTRACTED_ISO_TEMP_DIR}
> +}
> +
> +modifyiso() {
> +
> +}
> +
> +repackiso() {
> +    # Repack the ISO image
> +    mkisofs -o ${NEW_ISO_TEMP_DIR}/${ISO_IMAGE_NAME}.iso -U -r -v -T -J -joliet-long -V ${ISO_LABEL} \
> +            -volset ${ISO_LABEL} -A ${ISO_LABEL} -b ${BOOT_IMAGE} -c ${BOOT_CATALOG} -no-emul-boot \
> +            -boot-load-size 4 -boot-info-table -J -R -V ${ISO_LABEL} -eltorito-alt-boot \
> +            -eltorito-boot ${EFI_IMAGE} -no-emul-boot ${EXTRACTED_ISO_TEMP_DIR}
> +
> +    mv -f ${NEW_ISO_TEMP_DIR}/${ISO_IMAGE_NAME}.iso ${WORKDIR}
> +}
> +
> +# Write the test data in IMAGE_POSTPROCESS_COMMAND
> +IMAGE_POSTPROCESS_COMMAND += "write_image_test_data; "
> +
> +do_unpack[depends] += "cdrtools-native:do_populate_sysroot libarchive-native:do_populate_sysroot"
> +do_unpack[postfuncs] += "unpackiso modifyiso repackiso"
> +do_unpack[cleandirs] += "${EXTRACTED_ISO_TEMP_DIR} ${NEW_ISO_TEMP_DIR}"
> \ No newline at end of file
> -- 
> 2.25.1
> 
> 

